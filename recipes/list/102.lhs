---
title: リストで隣り合う要素をまとめる
description: group, groupByの使い方
tags: list
date: 2013-04-12
---

> import Data.List
> import Data.Funtion

リストで隣り合う要素をまとめたいときは`group`を使用します。

- `Data.List.group`{.hoogle}

```bash
ghci> group "ABCCB"
["A","B","CC","B"]
```

`group`は隣り合っている要素だけをまとめるため、離れた位置にあるものをまとめたいときは`sort`で予め並べ替えるなど工夫する必要があります。

```bash
ghci> group $ sort "ABCCB"
["A","BB","CC"]
```

`group`では`(==)`を使って同一の要素か判定しますが、任意の条件を指定したいときは`groupBy`を使います。

- `Data.List.groupBy`{.hoogle}

```bash
ghci> groupBy (\a b -> length a == length b) ["foo", "bar", "hoge", "fuga"]
[["foo","bar"],["hoge","fuga"]]
```

```bash
ghci> groupBy ((==) `on` length) ["foo", "bar", "hoge", "fuga"]
[["foo","bar"],["hoge","fuga"]]
```