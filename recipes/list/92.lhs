---
title: リストを逆順に並び替える
description: reverseの使い方
tags: list
date: 2013-04-02
---

> import Prelude

リストを逆順に並び替えるには`Data.List.reverse`{.hoogle}を使います。

```bash
ghci> reverse [1..9]
[9,8,7,6,5,4,3,2,1]

ghci> reverse []
[]
```

無限リストに対して`reverse`を適用すると、末尾の値を評価しようとして止まらなくなってしまうので注意が必要です。

```bash
ghci> reverse [1..]
-- 応答が帰ってこない
```