---
title: 複素数を使う
description: Data.Complexを使います。
tags: standard_library, number
date: 2013-01-29
---

今回使用するアクションは以下のmoduleのimportが必要です。

> import Data.Complex

Haskellで複素数を扱うときは[Data.Complex]を使います。
複素数を作るには、いかのいずれかを使用します。

- `(:+) :: a -> a -> Complex a` 実数と虚数を指定
- `mkPolar :: RealFloat a => a -> a -> Complex a` 大きさと偏角を指定
- `cis :: RealFloat a => a -> Complex a` 大きさ1で偏角を指定

```bash
ghci> 1.0 :+ 2.0
1.0 :+ 2.0
it :: Complex Double
ghci> mkPolar 3 0
3.0 :+ 0.0
it :: Complex Double
ghci> cis 0
1.0 :+ 0.0
it :: Complex Double
```

実数部と虚数部を取得するには、以下の関数を使います。

- `realPart :: RealFloat a => Complex a -> a` 実数部を取得
- `imagPart :: RealFloat a => Complex a -> a` 虚数部を取得

```bash
ghci> let c1 = 1.0 :+ 2.0
c1 :: Complex Double
ghci> realPart c1
1.0
it :: Double
ghci> imagPart c1
2.0
it :: Double
```

大きさと偏角を取得する場合は、以下の関数を使います。

- `polar :: RealFloat a => Complex a -> (a, a)` 大きさと偏角をタプルで返す
- `magnitude :: RealFloat a => Complex a -> a` 大きさを返す
- `phase :: RealFloat a => Complex a -> a` 偏角を返す

```bash
ghci> let c = 1.0 :+ 2.0
c :: Complex Double
ghci> polar c
(2.23606797749979,1.1071487177940906)
it :: (Double, Double)
ghci> magnitude c
2.23606797749979
it :: Double
ghci> phase c
1.1071487177940906
it :: Double
```

タプルで複素数を表現することもできますが、タプルと異なり、基本的な数値演算が予め定義されています。
例えば、複素数同士の足し算は[Data.Complex]には定義されていないように見えますが、
`data Complex`の定義のところに`Num`のinstanceがあるので、以下のように
複素数同士の足し算などをすることができます。

```bash
ghci> let c1 = 1.0 :+ 2.0
c1 :: Complex Double
ghci> let c2 = 3.0 :+ 4.0
c2 :: Complex Double
ghci> c1 + c2
4.0 :+ 6.0
it :: Complex Double
```

また、自分でタプルを使って複素数を表現すると、`(Double, Double)`で表した時、
直交座標なのか極座標なのかわからなくなってしまいます。
余程の理由がない限り[Data.Complex]を使ったほうが簡単ですし、わかりやすいコードになるでしょう。

参考
----

- [Data.Complex]

[Data.Complex]: http://www.haskell.org/ghc/docs/latest/html/libraries/base/Data-Complex.html