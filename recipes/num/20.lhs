---
title: 数値が表現できる最大値・最小値を知りたい
description: maxBound、minBoundを使って表現できる範囲を調べます
tags: basics, prelude
date: 2013-01-20
---

`Int`が表現できる範囲を調べたいときは、`minBound :: a`と`maxBound :: a`を使います。
GHCi上でこれらを使うときは型を明示する必要があります。Int以外にもCharなど、多相関数となっているためGHCiがどの範囲を返せばいいのか判断するためです。

```bash
Prelude> minBound :: Int
-9223372036854775808
it :: Int
Prelude> maxBound :: Int
9223372036854775807
it :: Int
Prelude>
```

`Char`の範囲を確認することもできます。

```bash
Prelude> minBound :: Char
'\NUL'
it :: Char
Prelude> maxBound :: Char
'\1114111'
it :: Char
```

`Integer`は上限・下限の多倍長整数なので、これらの関数を使うことはできません。
使うことができるデータ型は`Bounded`という型クラスのinstanceが定義されています。
GHCi上では`:i [型名]`でどのinstanceになっているか確認することができます。

```bash
Prelude> :i Int
...
instance Bounded Int -- Defined in `GHC.Enum'
...
```

他にも、haddockをみるとclassのinstance一覧が表示されるので、こちらでも確認することができます。

- [Prelude - Bounded](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#t:Bounded)

参考
----

- [Prelude - minBound, maxBound](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:minBound)
