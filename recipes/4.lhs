---
title: 標準入力から文字列を読み込む
description: getChar、getLineを使って読み込む
tags: basics, prelude, stdin
date: 2013-01-04
---

一行読む場合は`getLine :: IO String`を使います。
以下は一行読み込み、文字数を表示する例です。

> test1 :: IO ()
> test1 = do
>     line <- getLine
>     print $ length line


一文字読む場合は`getChar :: IO Char`を使います。
以下の例は'q'が入力されると終了するアクションです。

> test2 :: IO ()
> test2 = do
>     ch <- getChar
>     if ch == 'q' then putStrLn "quit" else test2

参考
----

- [Prelude](http://www.haskell.org/ghc/docs/latest/html/libraries/base-4.6.0.0/Prelude.html#g:26)
