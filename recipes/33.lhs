---
title: ある文字列が部分文字列かどうか調べたい
description: Data.ListにあるisInfixOfなどの関数を使います
tags: string, standard_library
date: 2013-02-02
---

`isInfixOf :: Eq a => [a] -> [a] -> Bool`
を使うと、ある文字列が他方の文字列に含まれるかどうか確認できます。

```bash
ghci> isInfixOf "pen" "This is a pen."
True
it :: Bool
ghci> isInfixOf "hoge" "This is a pen."
False
it :: Bool
```

`isInfixOf`は最初と二個目の引数の型が同じ`[a]`になっており、どちらにどの文字列を指定するか混乱しそうですが、中置記法で使われるのを想像すれば、
一つ目の引数に探したい文字列を指定すればいいことがわかります。

```bash
ghci> "pen" `isInfixOf` "This is a pen."
True
it :: Bool
```

他にも、`isPrefixOf`や`isSuffixOf`と言った関数もあり、
先頭や末尾だけの確認で良い場合はこれらの関数も使用出来ます。

```bash
ghci> "This" `isPrefixOf` "This is a pen."
True
it :: Bool
ghci> "This" `isSuffixOf` "This is a pen."
False
it :: Bool
ghci> "pen." `isPrefixOf` "This is a pen."
False
it :: Bool
ghci> "pen." `isSuffixOf` "This is a pen."
True
it :: Bool
```

参考
----

- [Data.List - Predicates](http://www.haskell.org/ghc/docs/6.12.2/html/libraries/base-4.2.0.1/Data-List.html#12)