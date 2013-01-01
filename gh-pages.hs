{-# LANGUAGE OverloadedStrings #-}

module Main where
import Hakyll
import Control.Arrow
import Data.Monoid (mempty)

idCompiler :: RulesM (Pattern CopyFile)
idCompiler = do
  route idRoute
  compile copyFileCompiler

makeCookbookTagList :: String
        -> [Page String]
        -> Compiler () (Page String)
makeCookbookTagList tag posts =
    constA posts
        >>> pageListCompiler recentFirst "templates/postitem.hamlet"
        >>> arr (copyBodyToField "posts" . fromBody)
        >>> arr (setField "title" ("Posts tagged " ++ tag))
        >>> basicPageCompiler "templates/posts.hamlet"

cookbook = do
  -- Tags
  create "cookbook_tags" $
    requireAll "haskell_cookbook/**" (\_ ps -> readTags ps :: Tags String)

  -- Add a tag list compiler for every tag
  match "cookbook_tags/**" $ route $ setExtension ".html"
  metaCompile $ require_ "cookbook_tags"
    >>> arr tagsMap
    >>> arr (map (\(t, p) -> (tagIdentifier t, makeCookbookTagList t p)))

  -- cookbook用の記事一覧ページ
  match "index.html" $ route idRoute
  create "index.html" $ constA mempty
      >>> arr (setField "title" "Home")
      >>> requireA "cookbook_tags" (setFieldA "tags" renderTagList')
      >>> setFieldPageList recentFirst
            "templates/postitem.hamlet" "posts" "recipes/**"
      >>> basicPageCompiler "templates/index.hamlet"

  match "recipes/**.lhs" $ do
    route $ setExtension "html"
    compile $ pageCompiler
      >>> arr (renderDateField "date" "%Y/%m/%e" "Date unknown")
      >>> renderTagsField "prettytags" (fromCapture "cookbook_tags/**")
      >>> basicPageCompiler "templates/post.hamlet"
  where
    renderTagList' :: Compiler (Tags String) String
    renderTagList' = renderTagCloud tagIdentifier 100 150

    tagIdentifier :: String -> Identifier (Page String)
    tagIdentifier = fromCapture "cookbook_tags/**"

main :: IO ()
main = hakyllWith config $ do
  match "templates/*" $ compile templateCompiler
  match "images/**" idCompiler
  match "css/*.scss" $ do
    route   $ setExtension "css"
    compile $ getResourceString >>> unixFilter "sass" ["-s", "--scss", "--compass"]
                                >>> arr compressCss

  cookbook

config :: HakyllConfiguration
config = defaultHakyllConfiguration { deployCommand = deploy }
  where deploy = "cp -r _site/* .. && runghc gh-pages.hs clean"

-----------------------------------------------------------
-- utils
basicPageCompiler t = applyTemplateCompiler t
  >>> applyTemplateCompiler "templates/default.hamlet"
  >>> relativizeUrlsCompiler
