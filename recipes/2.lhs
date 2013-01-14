---
title: ファイルの中身を一度に読み込む
description: readFileを使ってファイルを読み込みます
tags: basics, file
date: 2013-01-02
---

ファイルの中身を読み込むには`readFile`を使います。

> -- readFile :: FilePath -> IO String
> test1 :: String -> IO ()
> test1 file = do
>   contents <- readFile file
>   print contents

行ごとに処理したい時は`lines`を併用します。

> -- lines :: String -> [String]
> test2 :: String -> IO ()
> test2 file = do
>   contents <- readFile file
>   print $ (length . lines) contents

参考
----

- [Prelude](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:readFile)
- [readFile - Hoogle](http://www.haskell.org/hoogle/?hoogle=readFile)
