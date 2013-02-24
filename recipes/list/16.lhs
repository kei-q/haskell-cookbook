---
title: リストの要素の重複を省く
description: nubを使って重複を省きます
tags: list, set
date: 2013-01-16
---

fuga

> module R20130116 where
> import Data.List (nub, nubBy)
> import Data.Function (on)

リストの要素の重複を省くには`nub :: (Eq a) => [a] -> [a]`を使用します。

> -- |
> -- >>> nub [1,2,2,1,3]
> -- [1,2,3]

このように、同じ要素が隣り合わせとなっている必要はありません。
また、同値判定が必要なため、リストの要素はEqのインスタンスである必要があります。

重複となる条件をこちらで指定したい場合は`nubBy :: (a -> a -> Bool) -> [a] -> [a]`を使用します。
こちらは(Eq a)の制約がなくなり、最初の引数に条件となる関数を受け取るようになっています。
これは、対象のデータがEqのインスタンスになっていない時や、Eqで定義されているものだと都合がわるい時に使用します。

TODO: 例が良くないので書きなおす

> data Pos = Pos { px :: Int, py :: Int }
> list1 = [(x,y) | x <- [1..3], y <- [1..3]]
> -- |
> -- >>> nubBy ((==) `on` fst) list1
> -- [(1,1),(2,1),(3,1)]

> -- |
> -- >>> nubBy ((==) `on` snd) list1
> -- [(1,1),(1,2),(1,3)]

ただし、`nub`や`nubBy`の計算量は`O(n^2)`であり、長いリストには適切ではありません。
データが多くなったり速度が大事なときは、Data.Setなど適切なデータ構造を選択する必要があります。

Data.Listには、nub以外にも集合演算をするために`delete`、`(\\)`、`union`、`intersect`が用意されています。
小さなデータをちょっと処理したいときには便利かもしれません。

関数名      型                           説明
----------  ---------------------------  -----------
delete      Eq a => a -> [a] -> [a]      指定した要素を削除
(\\)        Eq a => [a] -> [a] -> [a]    差集合
union       Eq a => [a] -> [a] -> [a]    和集合
intersect   Eq a => [a] -> [a] -> [a]    積集合


参考
----

- [Data.List - nub](http://lambda.haskell.org/platform/doc/current/ghc-doc/libraries/haskell2010-1.1.0.1/Data-List.html#v:nub)
- [Data.List - nubBy](http://lambda.haskell.org/platform/doc/current/ghc-doc/libraries/haskell2010-1.1.0.1/Data-List.html#v:nubBy)
