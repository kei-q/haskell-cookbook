---
title: deriving (Show) とは？
description: 型クラスの自動導出と、それができる型クラスについて
tags: haskell2010
date: 2013-02-23
---

dataを定義するとき、derivingを使ってinstanceを定義するコードを見たことがあるかと思います。
例えば、以下は自身で定義したPersonという型を文字列変換できるようShowのinstanceを加えたものです。

> data Person = Person { name :: String, age :: Int } deriving (Show)

これにより`show`が使えるようになり、文字列に変換することができるようになります。

```bash
ghci> show $ Person "kei_q" 99
"Person {name = \"kei_q\", age = 99}"
it :: String
```

このように自動導出できる型クラスはいくつかあり、 Haskell2010で使えるのは以下のとおりです。

- [Eq](http://www.haskell.org/hoogle/?hoogle=Eq)
- [Ord](http://www.haskell.org/hoogle/?hoogle=Ord)
- [Enum](http://www.haskell.org/hoogle/?hoogle=Enum)
- [Ix](http://www.haskell.org/hoogle/?hoogle=Ix)
- [Bounded](http://www.haskell.org/hoogle/?hoogle=Bounded)
- [Show](http://www.haskell.org/hoogle/?hoogle=Show)
- [Read](http://www.haskell.org/hoogle/?hoogle=Read)

参考
----

- [4.3.3 Derived Instances]
- [11 Specification of Derived Instances]
- [7.5. 「deriving」機構への拡張]

[4.3.3 Derived Instances]: http://www.haskell.org/onlinereport/haskell2010/haskellch4.html#x10-780004.3.3
[11 Specification of Derived Instances]: http://www.haskell.org/onlinereport/haskell2010/haskellch11.html#x18-18200011
[7.5. 「deriving」機構への拡張]: http://www.kotha.net/ghcguide_ja/latest/deriving.html#deriving-typeable