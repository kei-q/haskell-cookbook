---
title: 多倍長整数を扱う
description: IntとIntegerの違いについて
tags: prelude,
---

Haskellでは標準で多倍長整数を扱うために`Integer`という型が用意されています。
`Int`では表現できない桁でも計算することができます。

```bash
Prelude> maxBound :: Int
9223372036854775807
it :: Int

Prelude> (9223372036854775807 :: Int) + 1
-9223372036854775808
it :: Int

Prelude> (9223372036854775807 :: Integer) + 1
9223372036854775808
it :: Integer
```

`Int`では表現の範囲が決まっているため`Bounded`クラスの関数が使えます。
一方、`Integer`はことなり、`Bounded`の関数を使おうとするとエラーになります。

```bash
Prelude> maxBound :: Int
9223372036854775807
it :: Int

Prelude> maxBound :: Integer

<interactive>:19:1:
    No instance for (Bounded Integer)
      arising from a use of `maxBound'
    Possible fix: add an instance declaration for (Bounded Integer)
    In the expression: maxBound :: Integer
    In an equation for `it': it = maxBound :: Integer
```

`Int`と`Integer`は異なる型なので、両方を混ぜ合わせて計算することはできません。

```bash
Prelude> (1 :: Int) + (1 :: Integer)

<interactive>:20:15:
    Couldn't match expected type `Int' with actual type `Integer'
    In the second argument of `(+)', namely `(1 :: Integer)'
    In the expression: (1 :: Int) + (1 :: Integer)
    In an equation for `it': it = (1 :: Int) + (1 :: Integer)
```

計算するには両方の型を揃える必要があります。
`fromIntegral`を使うと型を揃えることができます。
fromIntegralを`Int`か`Integer`に適用するかで全体の型が決まります。

```bash
Prelude> let a = 1:: Int
a :: Int

Prelude> let b = 1 :: Integer
b :: Integer

Prelude> fromIntegral a + b
2
it :: Integer

Prelude> a + fromIntegral b
2
it :: Int
```

参考
----
