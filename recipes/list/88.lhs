---
title: リストから条件にマッチした要素から成るリストを返すには
description: filterについて
tags: list
date: 2013-03-29
---

> import Prelude

リストの先頭を取得する関数として`filter`{.hoogle}を使います。
最初の引数には取り出す条件を、２つ目の引数には対象となるリストを渡します。
この関数は`Prelude`で定義されているので、moduleをimportする必要はありません。

```bash
ghci> filter even [1..9]
[2,4,6,8]
```

他には、リスト内包表記で条件を指定することでも同様のことができます。
複数の条件を書くときはこちらのほうが簡潔になることもあるかもしれません。

```bash
ghci> [x | x <- [1..9], even x]
[2,4,6,8]

ghci> [x | x <- [1..9], even x, x `mod` 3 == 0]
[6]
```
