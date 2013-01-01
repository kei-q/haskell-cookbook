{-# LANGUAGE OverloadedStrings #-}
module Utils where

import Hakyll
import Control.Arrow

basicPageCompiler :: Identifier Template
                  -> Compiler (Page String) (Page String)
basicPageCompiler t = applyTemplateCompiler t
  >>> applyTemplateCompiler "templates/default.hamlet"
  >>> relativizeUrlsCompiler

sassCompiler :: Compiler Resource String
sassCompiler = getResourceString
           >>> unixFilter "sass" ["-s", "--scss", "--compass"]
           >>> arr compressCss

idCompiler :: RulesM (Pattern CopyFile)
idCompiler = do
  route idRoute
  compile copyFileCompiler

rssRule :: FeedConfiguration -> Pattern (Page String) -> RulesM (Identifier String)
rssRule feedConfiguration pattern = do
  match "rss.xml" $ route idRoute
  create "rss.xml" $ requireAll_ pattern >>> renderRss feedConfiguration

