---
title: コマンドライン引数を使う
description: getArgsを使ってコマンドライン引数を処理します
tags: basics
date: 2013-01-27
---

今回使用するアクションは以下のmoduleのimportが必要です。

> import System.Environment (getArgs)

コマンドライン引数を取得するには`getArgs :: IO [String]`を使います。
型からわかるとおり、取得した内容は文字列のリストとして返ってくるので、
それを適切に処理します。
以下は引数を一つとり、それを表示するだけの簡単な例です。

> main :: IO ()
> main = do
>   args <- getArgs
>   case args of
>     [] -> putStrLn "usage: ./Main <your name>"
>     (x:_) -> putStrLn $ "Hello, " ++ x

ghciでコマンドライン引数を試す場合は`:main`を使います。

```bash
ghci> :main
usage: ./Main <your name>
it :: ()
ghci> :main keqh
Hello, keqh
it :: ()
ghci> :main ほげ
Hello, ほげ
it :: ()
```

参考
----

- [haskell - Why are getArgs and getProgName IO actions? - Stack Overflow](http://stackoverflow.com/questions/14295582/why-are-getargs-and-getprogname-io-actions)