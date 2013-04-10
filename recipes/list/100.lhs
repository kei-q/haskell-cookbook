---
title: take関数で数ではなく条件で指定したいとき
description: takeWhileの使い方
tags: list
date: 2013-04-10
---

>

`take`では先頭n個の要素を取得しましたが、`takeWhile`を使うと`Int`ではなく条件を指定して取得します。

- `Data.List.takeWhile`{.hoogle}

```bash
ghci> takeWhile (<=3) [1,2,5,3,4]
[1,2]

ghci> takeWhile (<=100) [1,2,5,3,4]
[1,2,5,3,4]

ghci> takeWhile (<=0) [1,2,5,3,4]
[]
```

似た関数に`Data.List.filter`{.hoogle}がありますが、こちらはリストを最後まで調べるのに対し、`takeWhile`では条件に合わなかった時点で評価を止めます。

```bash
ghci> takeWhile (<=3) [1,2,5,3,4]
[1,2]

ghci> filter (<=3) [1,2,5,3,4]
[1,2,3]
```

