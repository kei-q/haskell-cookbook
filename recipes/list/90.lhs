---
title: リストの長さを調べるには
description: lengthの使い方とその注意点
tags: list
date: 2013-03-31
---

Haskellでリストの長さを調べるには`Data.List.length`{.hoogle}を使います。

```bash
ghci> length [1,2,3]
3

ghci> length []
0
```

`length`は有限リストのみ有効です。もし無限リストに`length`を適用してしまうと、処理が帰ってこなくなるので注意が必要です。

```bash
ghci> length [1..]
-- 応答なし
```