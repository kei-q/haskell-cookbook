---
title: Setで集合演算
description: union, intersection, difference
tags: containers
date: 2013-03-27
---

> import Data.Set (Set)
> import qualified Data.Set as S

今回のサンプルでは以下のデータを使用します。

> test1, test2 :: Set String
> test1 = S.fromList ["hoge", "fuga", "zzz"]
> test2 = S.fromList ["foo", "bar", "zzz"]

`Data.Map`には以下の関数が用意されています。
それぞれ和集合・積集合・差集合を返します。

- `Data.Set.union`{.hoogle}
- `Data.Set.intersection`{.hoogle}
- `Data.Set.difference`{.hoogle}

```bash
ghci> S.union test1 test2
fromList ["bar","foo","fuga","hoge","zzz"]

ghci> S.intersection test1 test2
fromList ["zzz"]

ghci> S.difference test1 test2
fromList ["fuga","hoge"]
```