---
title: takeとdropを同時に使用するとき
description: splitAtの使い方
tags: list
date: 2013-04-09
---

>

`take`と`drop`を同時に使うときは`splitAt`を使うのが便利です。
この関数は、`take`や`drop`と同様の引数を取り、両方の結果をタプルで返します。

- `Data.List.split`{.hoogle}

```bash
ghci> splitAt 3 [1..9]
([1,2,3],[4,5,6,7,8,9])

ghci> splitAt 3 []
([],[])

ghci> splitAt 0 [1..9]
([],[1,2,3,4,5,6,7,8,9])

ghci> splitAt 100 [1..9]
([1,2,3,4,5,6,7,8,9],[])
```

splitは以下と同等です。

> splitAt' n xs = (take n xs, drop n xs)
