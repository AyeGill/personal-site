{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import Data.ByteString.Lazy.Char8 (pack, unpack)
import qualified Network.URI.Encode as URI (encode)
import           Hakyll
import           Hakyll.Web.Template.Context
import           Hakyll.Web.Pandoc.Biblio
import           Text.Blaze.Html                 (toHtml, toValue, (!))
import           Text.Blaze.Html.Renderer.String (renderHtml)

import qualified Data.Map as M
import Data.Maybe
import Data.Map (Map)
import Data.List.Split
import qualified Text.Blaze.Html5                as H
import qualified Text.Blaze.Html5.Attributes     as A
import qualified Data.Set as S
import           Text.Pandoc.Options
import Control.Monad (liftM)
import           Data.List           (intercalate, intersperse)
import           Control.Monad.State
import Control.Monad.Error
import           Text.Pandoc.JSON
import           Text.Pandoc.Walk    (walk, walkM)
import qualified Data.Char as Char
import System.FilePath.Posix
import Text.BibTeX.Parse (file, skippingLeadingSpace)
import Text.BibTeX.Entry (T(Cons))
import Text.Parsec.String (parseFromFile)

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

orElse :: Maybe a -> a -> a
orElse (Just x) _ = x
orElse Nothing x = x
--------------------

--- Contexts -------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

tagsField' :: String -> Tags -> Context a
tagsField' = tagsFieldWith getTags simpleRenderLink (mconcat . intersperse ", ")

simpleRenderLink :: String -> Maybe FilePath -> Maybe H.Html
simpleRenderLink _   Nothing         = Nothing
simpleRenderLink tag (Just filePath) =
  Just $ H.a ! A.href (toValue $ toUrl filePath) $ toHtml tag


postCtxWithTags :: Tags -> Context String
postCtxWithTags tags =  tagsField "tags" tags
                        `mappend` postCtx

pdfCtx :: Context CopyFile
pdfCtx = metadataField `mappend` urlField "url" `mappend` pathField "title"

---------------------


--- Compilers ------
bibmathCompiler :: String -> String -> Compiler (Item String)
bibmathCompiler cslFileName bibFileName = do
   -- csl <- load $ fromFilePath cslFileName
   -- bib <- load $ fromFilePath bibFileName
    body <- getResourceBody
    pandoc <- readPandocWith readerOptions body
    bib <- loadBibliography bibfile
    pandocTikzAtom <- withItemBody (fmap (buildCites bib . buildAtoms) . buildTikz) pandoc
    return $ writePandocWith writerOptions $ pandocTikzAtom

listDir :: Compiler [Item String] -- find the posts to link from curent dir.
-- When run on /foo/bar/baz.md, returns the items /foo/bar/qux.md, 
-- /foo/bar/slurp.md, and /foo/bar/derp/index.md
listDir = do
    path <- normalise <$> getResourceFilePath
    --unsafeCompiler $ print path
    let filesGlob = fromGlob $ takeDirectory path ++ "/*"
        dirsGlob = fromGlob $ takeDirectory path ++ "/*/index.md"
    files <- loadAll (filesGlob .&&. complement (fromGlob path)) --Don't match the index file itself.
    dirs <- loadAll dirsGlob
    --unsafeCompiler $ print files
    --unsafeCompiler $ print filesGlob
    return $ files ++ dirs

dirIndexCompiler :: Tags -> Compiler (Item String)
dirIndexCompiler tags = do
    links <- listDir
    let indexCtx = listField "posts" postCtx (return links) `mappend`
                   postCtx
    bibmathCompiler cslfile bibfile
        >>= loadAndApplyTemplate "templates/post.html" (postCtxWithTags tags)
        >>= loadAndApplyTemplate "templates/index.html" indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

mainIndexCompiler :: Compiler (Item String)
mainIndexCompiler = do 
    links <- (++) <$> loadAll "content/*" <*> loadAll "content/*/index.md"
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
config :: Configuration
config = defaultConfiguration {
    deployCommand = "cd _site && rsync -r . ayegill_efr-personal@ssh.phx.nearlyfreespeech.net:"
}

main :: IO ()
main = hakyllWith config $ do
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
    
    match "templates/*" $ compile templateCompiler
    
    --- Bibliography business
    match "bibliography/bib.csl" $ compile cslCompiler
    match "bibliography/Citations.bib" $ compile biblioCompiler

    --- Tags:
    tags <- buildTags "content/**" (fromCapture "tags/*.html")
    tagsRules tags $ \tag pattern -> do
        let title = "Posts tagged \"" ++ tag ++ "\""
        route idRoute
        compile $ do
            posts <- loadAll pattern
            let ctx = constField "title" title
                      `mappend` listField "posts" postCtx (return posts)
                      `mappend` defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/tag.html" ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= relativizeUrls


    --- Build tags page

    create ["tags.html"] $ do
        route idRoute
        compile $ do
            tagsString <- renderTags (\tag url _ _ _ -> "<li><a href=\"" ++ url ++ "\">" ++ tag ++ "</a></li>")
                                     (\tagStrs -> "<ul>" ++ intercalate "\n" tagStrs ++ "</ul>")
                                     tags
            makeItem "" >>= loadAndApplyTemplate "templates/default.html" (constField "body" tagsString `mappend` constField "title" "Tags")
                        >>= relativizeUrls




    match "content/*.tex" $ do -- .tex files get a template with a bunch of commands applied before pandoc.
        route $ setExtension "html"
        compile $ getResourceBody
            >>= loadAndApplyTemplate "templates/tex-commands.tex" postCtx
            >>= renderPandocMath
            >>= loadAndApplyTemplate "templates/post.html"    (postCtxWithTags tags)
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    match "content/**/index.md" $ do -- Compile all index files.
        route $ setExtension "html"
        compile $ dirIndexCompiler tags


    -- Don't parse index files twice
    match (("content/**.md" .||. "content/**.html") .&&. notIndex) $ do
        route $ setExtension "html"
        compile $ bibmathCompiler cslfile bibfile
            >>= loadAndApplyTemplate "templates/post.html"    (postCtxWithTags tags)
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    match "index.md" $ do -- Treat this as an index for the content dir
        route $ setExtension "html"
        compile $ mainIndexCompiler

    match "personal.md" $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    
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

--- Citations processing
type Bibliography = Map String [(String,String)] -- id to fields. We ignore entry types for the moment.

citeFilter :: Bibliography -> Inline -> Inline
citeFilter bib (Cite t s) = Span nullAttr $ map (showCite bib) t
citeFilter _ x = x


---TODO: Make something better here.
showCite :: Bibliography -> Citation -> Inline
showCite bib (Citation citeId _ _ _ _ _) = case M.lookup citeId bib of
    Nothing -> Strong [Str $ "???" ++ citeId]
    Just citeFields -> 
        let title = lookup "Title" citeFields `orElse` citeId 
            url = (lookup "URL" citeFields >>= \url -> return $ Link nullAttr [Str title] (url,title)) `orElse` Str ""
            
            authorsStr = lookup "Author" citeFields `orElse` ""
            authors = splitOn " and " authorsStr
            authorAbbrev = abbrev authors
            year = lookup "Year" citeFields `orElse` "????"
            inline = undefined
        in Span nullAttr $ [Str $ "\"" ++ authors ++ ": " ++ title ++ "\"", Note [Plain [url]]]

buildCites :: Bibliography -> Pandoc -> Pandoc
buildCites bib = walk $ citeFilter bib

normalizeAuthor :: String -> String -- try to do something reasonable. TODO: "John Smith -> Smith" "Smith, John -> Smith"
normalizeAuthor str =  head $  splitOn ", " str


loadBibliography :: FilePath -> Compiler Bibliography
loadBibliography path = do
    parse <- unsafeCompiler $ parseFromFile (skippingLeadingSpace file) path
    case parse of
        Left err -> throwError [show err]
        Right entryList -> return $ M.fromList (map (\(Cons _ entryId fields) -> (entryId, fields)) entryList)