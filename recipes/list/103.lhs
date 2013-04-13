---
title: リストのn番目の要素を取り出したい
description: (!!)の使い方
tags: list
date: 2013-04-13
---

>

リストのn番目の要素を取り出したいときは`(!!)`が使えます。
数値は0始まりで指定します。

- `!!`{.hoogle}

```bash
ghci> [1,2,3] !! 0
1

ghci> [1,2,3] !! 2
3
```

負の数やリストより大きい値を指定してしまうと実行時エラーとなってしまいます。
そのため、この演算子の使用は極力使うのを避け、他に適切な関数やデータ構造がないか
検討したほうが良いでしょう。

```bash
ghci> [1,2,3] !! (-1)

<interactive>: Prelude.(!!): negative index

ghci> [1,2,3] !! 100

<interactive>: Prelude.(!!): index too large
```
