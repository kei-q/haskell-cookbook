---
title: リストの先頭の要素を取得する
description: リストの先頭の要素を取得する方法と注意点
tags: list
date: 2013-03-28
---

リストの先頭を取得する関数として`head`{.hoogle}が定義されています。

```bash
ghci> head [1,2,3]
1
```

しかし、この関数は極力避けるべきです。
なぜなら、この関数に空リストを渡すと実行時エラーになるためです。

```bash
ghci> head []
<interactive>: Prelude.head: empty list
```

先頭の要素がどうしても欲しい場合は、パターンマッチを使って空リストの時の値を定義しましょう。こうすると抜け漏れがなくなり、エラーが減らせます。

> head' [] = Nothing
> head' (x:_) = Just x
>
> head'' xs = case xs of
>     [] -> Nothing
>     (x:_) -> Just x

先頭の要素だけがほしいとき、`head`を多用するのは良くない兆候のように思います。
例えば、以下の文字列のリストはコマンドラインの入力を表現しているとします。

> command :: [String]
> command = ["ghc", "--make", "Main.hs"]

全て同じ`String`ですが、最初の値と残りで役割が異なります。このような場合は、
`head`で先頭の要素を取得するのではなく、
以下の様な型を用意して以後その方を使うようにしたほうが意図が明確になり、ミスが減ると思います。

> type Arg = String
> type Exe = String
> data Command = Command Exe [Arg]

> parse [] = Nothing
> parse (exe:args) = Command exe args
