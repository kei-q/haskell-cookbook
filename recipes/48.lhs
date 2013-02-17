---
title: 任意の条件でソートしたい
description: comparingを使います
tags: base
date: 2013-02-17
---

以下の様なデータを対象にソートしてみましょう。

```bash
ghci> let sample = zip [1..5] ['e','d'..'a']
sample :: [(Integer, Char)]
ghci> sample
[(1,'e'),(2,'d'),(3,'c'),(4,'b'),(5,'a')]
it :: [(Integer, Char)]
```

[Data.List]にあるsortを使うと、次のようになります。
これはタプルが辞書順で比較し、最初の要素が数値なのでそれでsortされています。

```bash
ghci> sort $ zip sample
[(1,'e'),(2,'d'),(3,'c'),(4,'b'),(5,'a')]
it :: [(Integer, Char)]
```

Ordの定義以外でソートしたいときは`sortBy`を使用して、条件を明示する必要があります。
例えば、上記の例で２つ目の文字でsortしたい場合は、以下のようにします。

```bash
ghci> sortBy (\a b -> snd a `compare` snd b) sample
[(5,'a'),(4,'b'),(3,'c'),(2,'d'),(1,'e')]
it :: [(Integer, Char)]
```

上記の例では比較対象を変数に割り当て、それぞれ`snd`で比較したいデータを
取得してから`compare`をしようしています。
これでは面倒なので、[Data.Ord]に`comparing`という関数が用意されています。
これを用いると、以下のように`snd`の要素で比較することが明確になります。

```bash
ghci> sortBy (comparing snd) sample
[(5,'a'),(4,'b'),(3,'c'),(2,'d'),(1,'e')]
it :: [(Integer, Char)]
```

参考
----

- [Data.List]
- [Data.Ord]

[Data.List]: http://lambda.haskell.org/platform/doc/current/ghc-doc/libraries/haskell2010-1.1.0.1/Data-List.html
[Data.Ord]: http://lambda.haskell.org/platform/doc/current/ghc-doc/libraries/base-4.5.1.0/Data-Ord.html