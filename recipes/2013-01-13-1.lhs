---
title: 分割してできた文字列のリストを連結する
description: intercalateを使って文字列を連結します。
tags: string, list
---

> module R20130113 where
> import Data.List (intercalate)

 #2013-01-12-1.lhs の記事では文字列を分割しましたが、
 逆に分割した文字列をつなげるには`intercalate :: [a] -> [[a]] -> [a]`が使えます。
 この関数を使用するには`Data.List`をimportする必要があります。

 例えば、','区切りで分割した文字列をまたつなぎ合わせるには次のようにします。

> -- |
> -- >>> intercalate "," ["hoge", "fuga"]
> -- "hoge,fuga"

間に埋める文字列は任意の文字列を指定できるので、
以下のように複数文字でも大丈夫です。

> -- |
> -- >>> intercalate "::" ["hoge", "fuga"]
> -- "hoge::fuga"

参考
----

- [Data.List](http://lambda.haskell.org/platform/doc/current/ghc-doc/libraries/haskell2010-1.1.0.1/Data-List.html)
