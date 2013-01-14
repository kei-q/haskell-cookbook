---
title: 文字列を分割する
description: Data.List.Splitを使って分割します
tags: string, list, standard library
date: 2013-01-12
---

> module R20130112 where

> import Data.List.Split

`"hoge,fuga,piyo"`のような文字列を','区切りで分割して`["hoge","fuga","piyo"]`という
文字列のリストに変換したいことはよくあると思います。
文字列を行に分割するのは`lines`、単語単位に分割するのは`words`がPreludeに用意されていますが、
上記のような処理をする関数はPreludeやData.Listに含まれていません。
そのため、linesやwordsのコードをコピペして分割する関数を定義した人もそれなりにいるのではないでしょうか。

実はこのような処理をするためのpackageがHaskell Platformには含まれており、
`Data.List.Split`をimportすることで使うことができます。

このmoduleをimportすると、リスト（文字列含む）を分割する様々な関数が使えるようになります。
例えば、この文章の最初にあった','区切りの文字列を分割するには、次のようにします。

> -- |
> -- >>> splitOn "," "hoge,fuga,piyo"
> -- ["hoge","fuga","piyo"]

splitOnは最初の引数に二文字以上を渡すと、それで区切ります。

> -- |
> -- >>> splitOn "::" "hoge::fuga::piyo"
> -- ["hoge","fuga","piyo"]

どれか一つの文字で区切ってほしいときは`splitOneOf`が用意されています。

> -- |
> -- >>> splitOneOf ";," "hoge;fuga,piyo"
> -- ["hoge","fuga","piyo"]

上記の関数の他に、表にある関数が用意されています。

関数名            型                                説明
----------------- --------------------------------- ----
splitOn           Eq a => [a] -> [a] -> [[a]]       文字列で分割
splitOneOf        Eq a => [a] -> [a] -> [[a]]       文字列に含まれるいずれかの文字で分割
splitWhen         (a -> Bool) -> [a] -> [[a]]       条件にあった要素で分割
endBy             Eq a => [a] -> [a] -> [[a]]       末尾にも記号があるとして処理
endByOneOf        Eq a => [a] -> [a] -> [[a]]       endByのOneOf版
wordsBy           (a -> Bool) -> [a] -> [[a]]       wordsの一般化版 (words = wordsBy isSpace)
linesBy           (a -> Bool) -> [a] -> [[a]]       linesの一般化版 (lines = linesBy (=='\n'))
chunksOf          Int -> [e] -> [[e]]               n個ずつ分割
splitPlaces       Integral a => [a] -> [e] -> [[e]] 指定した数値分ずつ分割
splitPlacesBlanks Integral a => [a] -> [e] -> [[e]] splitPlacesで余った数値分は[]を挿入

参考
----

- [Data.List.Split](http://lambda.haskell.org/platform/doc/current/packages/split-0.2.1.1/doc/html/Data-List-Split.html)
- [Data.List.Split.Internals](http://lambda.haskell.org/platform/doc/current/packages/split-0.2.1.1/doc/html/Data-List-Split-Internals.html)
