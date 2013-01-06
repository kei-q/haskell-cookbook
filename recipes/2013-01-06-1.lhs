---
title: 文字列を連結する
description: (++)を使って文字列を連結します
tags: string, prelude, list
---

> -- これがないとdoctestが使えない
> module R20130106 where

文字列を連結するには[`(++) :: [a] -> [a] -> [a]`](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:-43--43-)を使います。
文字列は文字のリスト(`[Char]`)として表現されるため、リストの関数や演算子が使用できます。

> test1 :: String
> test1 = "hoge" ++ "fuga"
> -- |
> -- >>> test1
> -- "hogefuga"

複数の文字列を一度に連結する場合は[`concat :: [[a]] -> [a]`](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:concat)を使うと簡潔になります。

> testdata :: [String]
> testdata = ["hoge\n", "fuga\n", "piyo\n"]
> -- |
> -- >>> concat testdata
> -- "hoge\nfuga\npiyo\n"

参考
----

- [`(++) :: [a] -> [a] -> [a]`](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:-43--43-)
- [`concat :: [[a]] -> [a]`](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:concat)