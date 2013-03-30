---
title: リストが空かどうか判定するには
description: リストが空かどうか判定するには
tags: list
date: 2013-03-30
---

今回は以下の値を使います。

> list, nullList :: [Int]
> list = [1,2,3]
> nullList = []

listは`Eq`のinstanceなので、以下のように`(==)`で空かどうか判定できます。

```bash
ghci> list == []
False

ghci> nullList == []
True
```

`Data.List.null`{.hoogle}という関数も用意されています。
場合によっては、こちらのほうが可読性が高まるでしょう。

```bash
ghci> null list
False

ghci> null nullList
True
```

`Bool`値を得るだけでなく、判定した後に値を評価するならパターンマッチを使うと良いでしょう。
以下は`[]`なら0を返し、それ以外ならリスト内のもっとも大きい値を返す関数です。

> f [] = 0
> f xs = maximum xs

```bash
ghci> f list
3

ghci> f nullList
0
```