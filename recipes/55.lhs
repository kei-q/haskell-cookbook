---
title: Enumの自動導出について
description: deriving (Enum)
tags: haskell2010
date: 2013-02-24
---

関係有りそうなIxやBoundedにも触れる？

自動導出可能な型クラスの一つに[Enum]があります。
例えば、服のサイズを表す型を以下の様に定義したとします。

> data Size = S | M | L | LL deriving (Show,Enum)

これで、一つ上のサイズや一つ下のサイズを簡単に扱えるようになります。

```bash
ghci> succ S
M
it :: Size
ghci> succ M
L
it :: Size
ghci> pred LL
L
it :: Size
```

また、[Enum]のインスタンスだとリストの略記法で使えるようになります。
例えば、全てのサイズを表す`[Size]`を表現したいときは以下のように書くことができます。

```bash
ghci> [S .. LL]
[S,M,L,LL]
it :: [Size]
```

これは、以下のように書いたものと同じになります。
`enumFromTo`{.hoogle}はEnumクラスのメソッドで、enumXXXが定義されていると
リストの`[n..]`、`[n..m]`、`[n,n'..m]`などが使えるようになります。

```bash
ghci> enumFromTo S LL
[S,M,L,LL]
it :: [Size]
```

参考
----

[Enum]: http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#t:Enum