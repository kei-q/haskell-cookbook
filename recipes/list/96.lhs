---
title: リストの要素で（最大|最小）の要素を調べる
description: maximum, minimumの使い方
tags: list
date: 2013-04-06
---

> import Data.Ord
> import Data.List

リストで最大の要素を調べるには`maximum`、最小の要素を調べるには`minimum`を使います。比較できる必要があるため、対象となる要素が`Ord`のinstanceである必要があります。

- `Data.List.maximum`{.hoogle}
- `Data.List.minimum`{.hoogle}

```bash
ghci> maximum [1..9]
9

ghci> minimum [1..9]
1
```

`maximum`や`minimum`では`Ord`のmethodを使用しますが、任意の条件で最大値、最小値を調べたいときは`maximumBy`, `minimumBy`を使用します。

- `Data.List.maximumBy`{.hoogle}
- `Data.List.minimumBy`{.hoogle}

以下は`maximumBy`を使った例です。`[a]`はmaximumでは辞書順で最大値を選びますが、`maximumBy`の例ではリストの長さで調べています。

```bash
ghci> maximum [[1,2,3], [4,5]]
[4,5]

ghci> maximumBy (comparing length) [[1,2,3], [4,5]]
[1,2,3]
```

