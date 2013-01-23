---
title: 数値の計算(Int + Floatなど)で型エラーがでるので合わせたい
description: fromIntegralやRealFracのメソッドを使用して型を合わせます
tags: num
date: 2013-01-23
---

整数と実数は別の方なので、そのままそれらを計算しようとすると型エラーが発生します。
例えば、整数と実数を足し合わせると、以下の様なエラーが発生します。
他の言語では表現の範囲が広い実数に変換されることがありますが、Haskellではそのようなことはありません。

```bash
[Prelude]
> (1::Int) + (1::Float)

<interactive>:2:13:
    Couldn't match expected type `Int' with actual type `Float'
    In the second argument of `(+)', namely `(1 :: Float)'
    In the expression: (1 :: Int) + (1 :: Float)
    In an equation for `it': it = (1 :: Int) + (1 :: Float)
```

計算するには、整数にしたいか実数にしたいかをコードで表現する必要があります。
もし結果を実数にしたいときは整数を変換する必要があります。
`fromIntegral :: (Integral a, Num b) => a -> b`を使用します。

```bash
[Prelude]
> let n = 1 :: Int
n :: Int
[Prelude]
> fromIntegral n :: Float
1.0
it :: Float
[Prelude]
> it + 1.3
2.3
it :: Float
```

逆に実数を整数に変換するには`truncate, round, ceiling, floor :: Integral b => a -> b`を使用します。
整数に変換するにあたり、小数点以下をどう扱うかによって関数を使い分けます。

- truncate: 0に近づける
- round: 四捨五入
- ceiling: 切り上げ
- floor: 切り捨て

```bash
> let a = 1.3 :: Float
a :: Float
[Prelude]
> truncate a
1
it :: Integer
[Prelude]
> round a
1
it :: Integer
[Prelude]
> ceiling a
2
it :: Integer
[Prelude]
> floor a
1
it :: Integer
```

参考
----

- [Prelude - RealFrac](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#t:RealFrac)
