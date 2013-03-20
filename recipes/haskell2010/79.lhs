---
title: 演算子を引数として渡したい
description: セクションの使い方
tags: haskell2010
date: 2013-03-20
---

Haskellには関数を引数にとる関数がたくさん定義されています。例えば`map`{.hoogle}は型から分かる通り関数とlistを引数に取り、それぞれに適用した結果を返します。

> positiveNumber = map abs [1,2,3]

このような関数に演算子を適用する場合はどうすればよいのでしょうか。
単純な方法としては、以下のようにラムダ式で書くものがあります。

```bash
ghci> zipWith (\x y -> x * y) [1..3] [1..3]
[1,4,9]
```

上記のコードはもっと単純に以下のように書くこともできます。`(*)`の部分が`(\x y -> x * y)`に相当し、この演算子を`()`で囲い関数にするのをセクションと呼びます。

```bash
ghci> zipWith (*) [1..3] [1..3]
[1,4,9]
```

セクションを用いた状態で部分適用したい場合は、演算子の左右どちらかに値を適用します。

```bash
ghci> map (/2) [1..3]
[0.5,1.0,1.5]
```

セクションで部分適用する場合は、引数を書く場所で意味が変わることに注意する必要があります。

```bash
ghci> map (2/) [1..3]
[2.0,1.0,0.6666666666666666]
```

なお、`-`で同じ事をしようとするとエラーが表示されてしまいます。
これは、`-`は単項演算子でもあるため、`-2`という値に`()`が付いているものと解釈されるためです。

```bash
ghci> map (-2) [1..3]

<interactive>:10:6:
    No instance for (Num (a0 -> b0))
      arising from a use of syntactic negation
    Possible fix: add an instance declaration for (Num (a0 -> b0))
    In the first argument of `map', namely `(- 2)'
    In the expression: map (- 2) [1 .. 3]
    In an equation for `it': it = map (- 2) [1 .. 3]
```

`subtract`{.hoogle}という関数が用意されているので、こちらを使用すると期待通りの動作になるかとおもいます。

```bash
ghci> map (subtract 2) [1..3]
[-1,0,1]
```

