{-# LANGUAGE OverloadedStrings #-}
module HakyllHelper where

import Control.Applicative
import Hakyll

defaultRules :: Rules ()
defaultRules = do
    match "templates/*" $ compile templateCompiler
    publish "images/*" idRoute copyFileCompiler
    scssCompiler "css/*.scss"

scssCompiler :: Pattern -> Rules ()
scssCompiler pattern =
 match pattern $ do
     route   $ setExtension "css"
     compile $ getResourceString
       >>= withItemBody (unixFilter "scss" ["-s", "-tcompressed"])

slimTemplate file ctx item = do
    tpl <- readSlimToTemplate file
    applyTemplate tpl ctx item

-- yabai
readSlimToTemplate file = do
    contents <- unsafeCompiler $ readFile file :: Compiler String
    readTemplate <$> unixFilter "slimrb" [] contents

publish pattern router compiler = match pattern $ do
    route router
    compile compiler

