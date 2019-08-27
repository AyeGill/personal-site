{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import Data.ByteString.Lazy.Char8 (pack, unpack)
import qualified Network.URI.Encode as URI (encode)
import           Hakyll
import           Hakyll.Web.Pandoc.Biblio
import qualified Data.Set as S
import           Text.Pandoc.Options
import Control.Monad (liftM)
import           Data.List           (intercalate)
import           Control.Monad.State
import           Text.Pandoc.JSON
import           Text.Pandoc.Walk    (walk, walkM)


bibmathCompiler :: String -> String -> Compiler (Item String)
bibmathCompiler cslFileName bibFileName = do
    csl <- load $ fromFilePath cslFileName
    bib <- load $ fromFilePath bibFileName
    body <- getResourceBody
    pandoc <- readPandocBiblio readerOptions csl bib body
    pandocTikz <- withItemBody buildTikz pandoc
    return $ writePandocWith writerOptions $ pandocTikz

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

cslfile = "bibliography/bib.csl"
bibfile = "bibliography/Citations.bib"

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

    match ("content/*.md" .||. "content/*.html") $ do
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
    
    -- Could also consider approach where we generate top-folder files using templates?
    match "content/2017.md" $ do
        route $ setExtension "html"
        compile $ bibmathCompiler cslfile bibfile
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "content/2018.md" $ do
        route $ setExtension "html"
        compile $ bibmathCompiler cslfile bibfile
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls
    match "content/2019.md" $ do
        route $ setExtension "html"
        compile $ bibmathCompiler cslfile bibfile
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "content/*/*/*.md" $ do
        route $ setExtension "html"
        compile $ bibmathCompiler cslfile bibfile
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
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
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

pdfCtx :: Context CopyFile
pdfCtx = metadataField `mappend` urlField "url" `mappend` pathField "title"

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
    where attr = (id, "tikspicture":extraClasses, namevals)
tikzFilter (CodeBlock (id, "tikzcd":extraClasses, namevals) contents) = pdfify "templates/tikzcd.tex" attr contents
    where attr = (id, "tikspicture":extraClasses, namevals)
tikzFilter x = return x

buildTikz :: Pandoc -> Compiler Pandoc
buildTikz = walkM tikzFilter