---
title: リストの要素を足し合わせる
description: sumの使い方
tags: list
date: 2013-04-17
---

>

リストの要素を足し合わせるには`sum`を使います。

- `Data.List.sum`{.hoogle}

```bash
ghci> sum [1,2,3]
6

ghci> sum []
0
```

`sum`は`(+)`使えることが前提となります。
必要であれば、`map`などを用いて変換すると良いでしょう。

```bash
ghci> sum $ map length ["hoge", "fuga", "piyo"]
12
```