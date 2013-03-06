---
title: 演算子の優先順位や結合則を確認したい
description: :infoでの確認とinfixの読み方について
tags: haskell2010
date: 2013-03-06
---

Haskellにはたくさんの演算子が存在していて、またユーザが演算子を定義することもできます。
それらの優先順位や結合則を確認するにはghciで`:info`(`:i`)を使用します。
例えば、`+`と`*`の演算子を確認すると以下の様な結果が出力されます。

```bash
ghci> :i +
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 +

ghci> :i *
class Num a where
  ...
  (*) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 7 *
```

上記の出力のうち、`infix`から始まる行が該当する情報となります。
左から順に以下のようになっています。

- 結合則
    - infixl : 左結合
    - infixr : 右結合
    - infix : 無結合
- 優先順位 : 0-9までの数値、高いほうが優先される
- 演算子

```bash
ghci> :i ++
(++) :: [a] -> [a] -> [a]       -- Defined in `GHC.Base'
infixr 5 ++
ghci> :i $
($) :: (a -> b) -> a -> b       -- Defined in `GHC.Base'
infixr 0 $
ghci> :i .
(.) :: (b -> c) -> (a -> b) -> a -> c   -- Defined in `GHC.Base'
infixr 9 .
```


参考
----
- [Nested Declarations]

[Nested Declarations]: http://www.haskell.org/onlinereport/haskell2010/haskellch4.html#x10-800004.4