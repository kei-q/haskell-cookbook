---
title: 文字列を数値に変換する
description: readを使って文字列を数値表現に変換します
tags: basics, prelude
---

文字列を数値に変換する一番簡単な方法は`read`です。

> test1 :: Int
> test1 = read "123"

実数は、型に`Float`や`Double`を指定することで変換できます。

> test2 :: Float
> test2 = read "123.456"

変換できない文字列の場合、例外が発生します。
以下のケースを評価しようとすると、末尾に'a'が含まれているため例外が発生します。

> -- *** Exception: Prelude.read: no parse
> test3 :: Int
> test3 = read "123a"

ghci上で型を指定せずに変換しようとすると、GHCはどの型にすればいいのかわからずエラーになるケースがあります。

```bash
Prelude> read "123"
<interactive>:9:1:
    Ambiguous type variable `a0' in the constraint:
      (Read a0) arising from a use of `read'
    Probable fix: add a type signature that fixes these type variable(s)
    In the expression: read "123"
    In an equation for `it': it = read "123"
```

この場合、直接型を明示するか、型が推論できる状況にする必要があります。

```bash
Prelude> read "123" :: Integer
123
it :: Integer

Prelude> 1 + read "123"
124
it :: Integer
```

参考
----

- [Prelude](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#t:Read)
