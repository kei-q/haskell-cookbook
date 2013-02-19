{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}

module CookBookCompiler(cookbookCompiler) where

import           Hakyll

import System.Process.QQ
import qualified Data.ByteString.Lazy.Char8 as BL

import Text.Pandoc

cacheName :: String
cacheName = "Hakyll.Web.Page.Cookbook"

tagName :: String
tagName = "hoogle"

cookbookCompiler :: Compiler (Item String)
cookbookCompiler = cached cacheName $ do
    body <- getResourceBody
    let (Item ident pandocBody) = readPandocWith defaultHakyllReaderOptions body
    pandocBody' <- unsafeCompiler $ at pandocBody
    return $ writePandocWith defaultHakyllWriterOptions $ Item ident pandocBody'

at :: Pandoc -> IO Pandoc
at = bottomUpM addType

addType :: Inline -> IO Inline
addType (Code attr@(_, classes, _) code)
  | tagName `elem` classes = do
    code' <- [cmd|hoogle #{code} | head -n 1 | cut -d ' ' -f 2- |]
    return $ Code attr (BL.unpack code')
addType inline = return inline
