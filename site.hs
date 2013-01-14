{-# LANGUAGE OverloadedStrings #-}
import           Control.Applicative
import           Data.Monoid
import           Hakyll
import           HakyllHelper

import Data.List (sortBy, intercalate)
import Data.Ord (comparing)
import qualified Data.Map as M
import Control.Monad (msum)
import           Data.Time.Format              (formatTime, parseTime)
import           System.FilePath               (takeBaseName, takeFileName)
import           System.Locale                 (TimeLocale, defaultTimeLocale)
import Numeric (readDec)


--------------------------------------------------------------------------------
-- configuration
config :: Configuration
config = defaultConfiguration
         { deployCommand = "cp -R _site/* /Users/keqh/Dropbox/www/cookbook; open -a 'google chrome' http://keqh.net/cookbook" }


--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith config $ do
    defaultRules

    let recipesPattern = "recipes/*"
    tags <- buildTags recipesPattern (fromCapture "tags/*.html")

    tagsRules tags $ \tag pattern -> do
        let title = "Posts tagged : " ++ tag
        route idRoute
        compile $ do
            list <- postList tags pattern recentFirst'
            makeItem ""
                >>= slimTemplate "templates/posts.slim" (tagsCtx title list)
                >>= defaultTemplate defaultContext
                >>= relativizeUrls

    publish recipesPattern (setExtension "html") $ pandocCompiler
        >>= slimTemplate "templates/recipe.slim" (postCtx tags)
        >>= defaultTemplate (postCtx tags)
        >>= relativizeUrls

    publish "index.html" idRoute $ do
        let indexCtx = mconcat [ field "posts" (\_ -> postList tags recipesPattern recentFirst') , field "tags" (\_ -> renderTagList tags) , defaultContext ]
        getResourceBody
            >>= applyAsTemplate indexCtx
            >>= defaultTemplate (postCtx tags)
            >>= relativizeUrls


--------------------------------------------------------------------------------
defaultTemplate = slimTemplate "templates/default.slim"


--------------------------------------------------------------------------------
tagsCtx title list = mconcat
    [ constField "title" title
    , constField "posts" list
    , defaultContext
    ]

postCtx :: Tags -> Context String
postCtx tags = mconcat
    [ modificationTimeField "mtime" "%U"
    , dateField "date" "%B %e, %Y"
    , tagsField "tags" tags
    , defaultContext
    ]


--------------------------------------------------------------------------------
postList :: Tags -> Pattern -> ([Item String] -> [Item String]) -> Compiler String
postList tags pattern preprocess = do
    posts <- preprocess <$> loadAll pattern
    tpl <- readSlimToTemplate "templates/postitem.slim"
    applyTemplateList tpl (postCtx tags) posts


--------------------------------------------------------------------------------
recentFirst' = reverse . (sortBy $ comparing aux)
  where
    readInt s
        | null a = 0
        | otherwise = fst $ head a
      where
        a = readDec s
    aux = readInt . takeBaseName . toFilePath . itemIdentifier

