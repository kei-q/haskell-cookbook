---
title: リストから部分列・順列を生成する
description: subsequences, permutationsの使い方
tags: list
date: 2013-04-03
---

今回使用する関数は以下のmoduleのimportが必要です。

> import Data.List

確認用データは以下を使用します。

> list :: [Int]
> list = [1,2,3]

部分列・順列の生成にはそれぞれ以下を使用します。

- `Data.List.subsequences`{.hoogle}
- `Data.List.permutations`{.hoogle}

使い方は以下のとおりです。

```bash
ghci> subsequences list
[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

ghci> permutations list
[[1,2,3],[2,1,3],[3,2,1],[2,3,1],[3,1,2],[1,3,2]]

```