--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
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
    pandoc <- readPandocBiblio def csl bib body
    return $ writePandocWith writerOptions $ pandoc

mathExtensions = [Ext_tex_math_dollars, Ext_tex_math_double_backslash,
                          Ext_latex_macros, Ext_implicit_figures]
defaultExtensions = writerExtensions defaultHakyllWriterOptions
newExtensions = foldr S.insert defaultExtensions mathExtensions
writerOptions = defaultHakyllWriterOptions {
                        writerExtensions = newExtensions,
                        writerHTMLMathMethod = MathJax ""
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


--- PANDOC SITENOTE CONTENT

getFirstStr :: [Inline] -> Maybe String
getFirstStr []                 = Nothing
getFirstStr (Str text:_      ) = Just text
getFirstStr (_       :inlines) = getFirstStr inlines

newline :: [Inline]
newline = [LineBreak, LineBreak]

-- This could be implemented more concisely, but I think this is more clear.
getThenIncr :: State Int Int
getThenIncr = do
  i <- get
  put (i + 1)
  return i

-- Extract inlines from blocks
coerceToInline :: [Block] -> [Inline]
coerceToInline = concatMap deBlock . walk deNote
 where
  deBlock :: Block -> [Inline]
  deBlock (Plain     ls    ) = ls
  -- Simulate paragraphs with double LineBreak
  deBlock (Para      ls    ) = ls ++ newline
  -- See extension: line_blocks
  --deBlock (LineBlock lss   ) = intercalate [LineBreak] lss ++ newline
  -- Pretend RawBlock is RawInline (might not work!)
  -- Consider: raw <div> now inside RawInline... what happens?
  deBlock (RawBlock fmt str) = [RawInline fmt str]
  -- lists, blockquotes, headers, hrs, and tables are all omitted
  -- Think they shouldn't be? I'm open to sensible PR's.
  deBlock _                  = []

  deNote (Note _) = Str ""
  deNote x        = x

filterInline :: Inline -> State Int Inline
filterInline (Note blocks) = do
  -- Generate a unique number for the 'for=' attribute
  i <- getThenIncr

  -- Note has a [Block], but Span needs [Inline]
  let content  = coerceToInline blocks

  -- The '{-}' symbol differentiates between margin note and side note
  let nonu     = getFirstStr content == Just "{-}"
  let content' = if nonu then tail content else content

  let labelCls = "margin-toggle" ++ (if nonu then "" else " sidenote-number")
  let labelSym = if nonu then "&#8853;" else ""
  let labelHTML =
        "<label for=\"sn-"
          ++ show i
          ++ "\" class=\""
          ++ labelCls
          ++ "\">"
          ++ labelSym
          ++ "</label>"
  let label = RawInline (Format "html") labelHTML

  let inputHTML =
        "<input type=\"checkbox\" id=\"sn-"
          ++ show i
          ++ "\" "
          ++ "class=\"margin-toggle\"/>"
  let input             = RawInline (Format "html") inputHTML

  let (ident, _, attrs) = nullAttr
  let noteTypeCls       = if nonu then "marginnote" else "sidenote"
  let note              = Span (ident, [noteTypeCls], attrs) content'

  return $ Span nullAttr [label, input, note]

filterInline inline = return inline

usingSideNotes :: Pandoc -> Pandoc
usingSideNotes (Pandoc meta blocks) =
  Pandoc meta (evalState (walkM filterInline blocks) 0)