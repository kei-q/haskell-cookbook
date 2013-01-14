---
title: 文字列の長さを調べる
description: lengthを使って文字列の長さを調べます
tags: prelude, string
date: 2013-01-07
---

> module R20130107 where

文字列の長さを調べるには[length :: [a] -> Int](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:length)を使います。

> test1 = length "hoge"
> -- |
> -- >>> test1
> -- 4

コード内での日本語はutf-8の文字列として解釈されます。

> test6 = length "日本語"
> -- |
> -- >>> test6
> -- 3

文字列が空文字列か判定したい場合は`length`ではなく[null :: [a] -> Bool](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:null)を使いましょう。
`length`はO(n)のため、文字列の長さに応じて処理に時間がかかってしまいます。

> test2 = length "hoge" == 0
> test3 = null "hoge"
> test4 = length "" == 0
> test5 = null ""
> -- |
> -- >>> test2
> -- False
> -- >>> test3
> -- False
> -- >>> test4
> -- True
> -- >>> test5
> -- True


参考
----

