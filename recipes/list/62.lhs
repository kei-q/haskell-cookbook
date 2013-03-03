---
title: リスト内の要素を探す
description: elem, filterなどのData.Listにある関数について
tags: list
date: 2013-03-02
---

> import Data.List
> import Data.Char

関数                   概要
----                   ----
`elem`{.hoogle}         ある要素が含まれているか
`notElem`{.hoogle}      not . elem
`find`{.hoogle}         条件にあう最初の要素を探す
`filter`{.hoogle}       条件にあうすべての要素を探す
`lookup`{.hoogle}       (key,value)なリストで該当するkeyのvalueを探す
`elemIndex`{.hoogle}    最初に見つかった要素の位置を返す
`elemIndices`{.hoogle}  見つかったようその位置全てを返す
`findIndex`{.hoogle}    条件に合う要素の最初の位置を返す
`findIndices`{.hoogle}  条件に合う要素のすべての位置を返す

要素がリストに含まれるかどうかだけ確認したいときは`elem`、`notElem`を使います。
中置記法を使うといくらか読みやすくなります。

```bash
ghci> 3 `elem` [1,2,3]
True
it :: Bool

ghci> 3 `notElem` [1,2,3]
False
it :: Bool
```

条件に該当する値を探したいときは `find` `filter` `lookup`を使います。

```bash
ghci> find even [1..9]
Just 2
it :: Maybe Integer

ghci> filter even [1..9]
[2,4,6,8]
it :: [Integer]

ghci> lookup 3 [(1,'a'),(2,'b'),(3,'c')]
Just 'c'
it :: Maybe Char
```

見つかった要素の位置を知りたいときは `elemIndex` `elemIndices` `findIndex` `findIndices`を使います。

```bash
ghci> elemIndex 'D' "aBcDeFg"
Just 3
it :: Maybe Int

ghci> elemIndices 'D' "aBcDeFg"
[3]
it :: [Int]

ghci> findIndex isUpper "aBcDeFg"
Just 1
it :: Maybe Int

ghci> findIndices isUpper "aBcDeFg"
[1,3,5]
it :: [Int]

```
