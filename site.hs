{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import Data.ByteString.Lazy.Char8 (pack, unpack)
import qualified Network.URI.Encode as URI (encode)
import           Hakyll
import           Hakyll.Web.Template.Context
import           Hakyll.Web.Pandoc.Biblio
import qualified Data.Set as S
import           Text.Pandoc.Options
import Control.Monad (liftM)
import           Data.List           (intercalate)
import           Control.Monad.State
import           Text.Pandoc.JSON
import           Text.Pandoc.Walk    (walk, walkM)
import qualified Data.Char as Char
import System.FilePath.Posix

--- Constants -------
cslfile = "bibliography/bib.csl"
bibfile = "bibliography/Citations.bib"
---------------------


-- Pandoc options ---
mathExtensions = [Ext_tex_math_dollars, Ext_tex_math_double_backslash,
                          Ext_latex_macros, Ext_implicit_figures]
defaultExtensions = writerExtensions defaultHakyllWriterOptions
newExtensions = foldr enableExtension defaultExtensions mathExtensions
writerOptions = defaultHakyllWriterOptions {
                        writerExtensions = newExtensions,
                        writerHTMLMathMethod = MathJax ""
                        }
readerOptions = defaultHakyllReaderOptions {
    readerExtensions = newExtensions
}
renderPandocMath = renderPandocWith defaultHakyllReaderOptions writerOptions

---------------------
--- Util ------------
lowercased :: String -> String
lowercased = map Char.toLower

capitalized :: String -> String
capitalized (head:tail) = Char.toUpper head : lowercased tail
capitalized [] = []

notIndex :: Pattern
notIndex = complement "**/index.md"
--------------------

--- Contexts -------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

pdfCtx :: Context CopyFile
pdfCtx = metadataField `mappend` urlField "url" `mappend` pathField "title"

---------------------


--- Compilers ------
bibmathCompiler :: String -> String -> Compiler (Item String)
bibmathCompiler cslFileName bibFileName = do
    csl <- load $ fromFilePath cslFileName
    bib <- load $ fromFilePath bibFileName
    body <- getResourceBody
    pandoc <- readPandocBiblio readerOptions csl bib body
    pandocTikzAtom <- withItemBody (fmap buildAtoms. buildTikz) pandoc
    return $ writePandocWith writerOptions $ pandocTikzAtom

listDir :: Compiler [Item String] -- find the posts to link from curent dir.
-- When run on /foo/bar/baz.md, returns the items /foo/bar/qux.md, 
-- /foo/bar/slurp.md, and /foo/bar/derp/index.md
listDir = do
    path <- normalise <$> getResourceFilePath
    unsafeCompiler $ print path
    let filesGlob = fromGlob $ takeDirectory path ++ "/*"
        dirsGlob = fromGlob $ takeDirectory path ++ "/*/index.md"
    files <- loadAll (filesGlob .&&. complement (fromGlob path)) --Don't match the index file itself.
    dirs <- loadAll dirsGlob
    unsafeCompiler $ print files
    unsafeCompiler $ print filesGlob
    return $ files ++ dirs

dirIndexCompiler :: Compiler (Item String)
dirIndexCompiler = do
    links <- listDir
    let indexCtx = listField "posts" postCtx (return links) `mappend`
                   postCtx
    bibmathCompiler cslfile bibfile
        >>= loadAndApplyTemplate "templates/post.html" postCtx
        >>= loadAndApplyTemplate "templates/index.html" indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

--------------------


--- Main body ------------------------------------------------------------------
--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    --"loose" files
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "js/*" $ do
        route idRoute
        compile copyFileCompiler
    
    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler
    match "et-book/*/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "pdfs/*.pdf" $ do
        route idRoute
        compile copyFileCompiler

    match "files/*" $ do
        route idRoute
        compile copyFileCompiler
    
    --- Bibliography business
    match "bibliography/bib.csl" $ compile cslCompiler
    match "bibliography/Citations.bib" $ compile biblioCompiler

    match "content/*.tex" $ do -- .tex files get a template with a bunch of commands applied before pandoc.
        route $ setExtension "html"
        compile $ getResourceBody
            >>= loadAndApplyTemplate "templates/tex-commands.tex" postCtx
            >>= renderPandocMath
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    match "content/**/index.md" $ do -- Compile all index files.
        route $ setExtension "html"
        compile $ dirIndexCompiler


    -- Don't parse index files twice
    match (("content/**.md" .||. "content/**.html") .&&. notIndex) $ do
        route $ setExtension "html"
        compile $ bibmathCompiler cslfile bibfile
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- loadAll "content/*"
            pdfs <- loadAll "pdfs/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    listField "pdfs" pdfCtx   (return pdfs)  `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

    match "index.md" $ do
        route $ setExtension "html"
        compile $ bibmathCompiler cslfile bibfile
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls
    match "contact.md" $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls


    match "templates/*" $ compile templateCompiler

    
--------------------------------------------------------------------------------

--- Pandoc filters for tikz stuff
pdfify :: String -> Attr -> String -> Compiler Block
pdfify tmpl attr contents =
    (imageBlock . ("data:image/svg+xml;utf8," ++) . URI.encode . filter (/= '\n') . itemBody <$>) $
    makeItem contents
     >>= loadAndApplyTemplate (fromFilePath tmpl) (bodyField "body")
     >>= withItemBody (return . pack 
                       >=> unixFilterLBS "rubber-pipe" ["--pdf"] 
                       >=> unixFilterLBS "pdftocairo" ["-svg", "-", "-"] 
                       >=> return . unpack)
  where imageBlock fname = Para [Image attr [] (fname, "")]

tikzFilter :: Block -> Compiler Block 
tikzFilter (CodeBlock (id, "tikzpicture":extraClasses, namevals) contents) = pdfify "templates/tikzpicture.tex" attr contents
    where attr = (id, "tikzpicture":extraClasses, namevals)
tikzFilter (CodeBlock (id, "tikzcd":extraClasses, namevals) contents) = pdfify "templates/tikzcd.tex" attr contents
    where attr = (id, "tikzpicture":extraClasses, namevals)
tikzFilter x = return x

buildTikz :: Pandoc -> Compiler Pandoc
buildTikz = walkM tikzFilter

--- Pandoc filter for "atoms":

atomList = ["theorem", "definition", "corollary", "example", "proposition", "lemma", "construction", "remark"]
-- "Atom" is my joint name for these things - a self-contained blob of information.

atomFilter :: Block -> Block
atomFilter (Div (id, classes, namevals) contents) = case classes of
    x:xs | lowercased x `elem` atomList -> Div (id, classes, namevals) $ [HorizontalRule, Header 4 (id, classes, namevals) $ [Str $ capitalized x]] ++ contents ++ [HorizontalRule]
    __ -> Div (id, classes, namevals) contents
atomFilter x = x

buildAtoms :: Pandoc -> Pandoc
buildAtoms = walk atomFilter
