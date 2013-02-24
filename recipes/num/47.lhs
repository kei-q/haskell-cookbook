---
title: 有理数を扱う
description: Data.Ratioモジュールを使用します
tags: base
date: 2013-02-16
---

有理数を扱うには[Data.Ratio]をimportします。

> import Data.Ratio

有理数のデータを用意するには、数値リテラルに型を明示するか、`(%)`を使います。

```bash
ghci> 9 :: Ratio Integer
9 % 1
it :: Ratio Integer
ghci> 2%3
2 % 3
it :: Ratio Integer
ghci> let n = 3 :: Integer
```

また、`Real`クラスの型なら`toRational`で変換することもできます。
逆にRationalから他の数値に変換したいときは`fromRational`を使います。

```bash
ghci> let n = 0.5 :: Float
n :: Float
ghci> toRational n
1 % 2
it :: Rational
ghci> fromRational it
0.5
it :: Double
```

このデータの型は`Num`クラスをはじめとしたメソッドがあるので、以下のように
計算することができます。

```bash
ghci> let r1 = 9 :: Ratio Integer
r1 :: Ratio Integer
ghci> let r2 = 2%3
r2 :: Ratio Integer
ghci> r1 + r2
29 % 3
it :: Ratio Integer
ghci> r1 - r2
25 % 3
it :: Ratio Integer
ghci> r1 * r2
6 % 1
it :: Ratio Integer
ghci> r1 / r2
27 % 2
it :: Ratio Integer
```

分母と分子を取得したいときは、`denominator`と`numerator`を使用します。

```bash
ghci> let r = 2%3
r :: Ratio Integer
ghci> numerator r
2
it :: Integer
ghci> denominator r
3
it :: Integer
```

参考
----

- [Data.Ratio]

[Data.Ratio]: http://hackage.haskell.org/packages/archive/base/4.6.0.1/doc/html/Data-Ratio.html
