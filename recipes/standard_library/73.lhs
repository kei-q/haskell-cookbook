---
title: Mapで集合演算
description: Mapでunion, intersection, difference
tags: containers
date: 2013-03-14
---

> import Data.Map (Map)
> import qualified Data.Map as M

今回のサンプルでは以下のデータを使用します。

> test1, test2 :: M.Map Int String
> test1 = M.fromList [(1,"hoge"), (2,"fuga")]
> test2 = M.fromList [(1,"foo"), (3,"bar")]

`Data.Map`には以下の関数が用意されています。
それぞれkeyを元に和集合・積集合・差集合を返します。
和や積の要素は最初に指定した引数の値が使われます。

- `Data.Map.union`{.hoogle}
- `Data.Map.intersection`{.hoogle}
- `Data.Map.difference`{.hoogle}

```bash
ghci> M.union test1 test2
fromList [(1,"hoge"),(2,"fuga"),(3,"bar")]

ghci> M.intersection test1 test2
fromList [(1,"hoge")]

ghci> M.difference test1 test2
fromList [(2,"fuga")]
```

和や積で両方の引数の値を考慮したいときは`-With`, `-WithKey`を使います。
これらは再祖も引数に関数を受け取り、値をどのようににマージするか指定します。

```bash
M.unionWith (\a b -> a ++ b) test1 test2
fromList [(1,"hogefoo"),(2,"fuga"),(3,"bar")]

ghci> M.unionWithKey (\key a b -> show key ++ ": " ++ a ++ b) test1 test2
fromList [(1,"1: hogefoo"),(2,"fuga"),(3,"bar")]

ghci> M.intersectionWith (\a b -> a ++ b) test1 test2
fromList [(1,"hogefoo")]

ghci> M.intersectionWithKey (\key a b -> show key ++ ": " ++ a ++ b) test1 test2
fromList [(1,"1: hogefoo")]
```
