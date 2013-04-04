---
title: リストのリストを平にする
description: concat, concatMapの使い方
tags: list
date: 2013-04-04
---

> list :: [[Int]]
> list = [[1,2,3],[4,5,6],[7,8,9]]

リストのリストを平にするには`Data.List.concat`{.hoogle}を使用します。
使い方は以下のとおりです。

```bash
ghci> concat list
[1,2,3,4,5,6,7,8,9]
```

`a -> [b]`となる関数とリストを`map`を適用し、その後`concat`することはよくあるため、
`Data.List.concatMap`{.hoogle}という関数が用意されています。

```bash
ghci> concatMap (\x -> [x,-x]) [1,2,3]
[1,-1,2,-2,3,-3]
```

