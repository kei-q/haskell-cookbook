---
title: 条件分岐する
description: ifを使って条件に応じて分岐します。
tags: basics, control sequence
date: 2013-01-08
---

> module R20130108 where

条件に応じて返す値を変える方法のひとつとして`if`を使うことができます。
例えば、２つの引数を取り、小さい方を返す`min`は以下のように定義できます。
`if`は値を返すため、このように定義することができます。

> min' :: Int -> Int -> Int
> min' a b = if a < b then a else b

これを実際に使うと以下のようになります。

> -- |
> -- >>> min' 1 3
> -- 1

`if`の条件文にはBoolを渡します。`then`と`else`の中身は同じ型である必要があります。
もし`then`と`else`に異なる型を指定すると、`if`全体での型推論に失敗してしまいます。

例えば、以下の様に`then`では数値、`else`では文字列を返すようにすると、
`Int`が来ると思っていたところで`[Char]`が返されてしまったので下記のようなメッセージが表示されます。

> -- test a b = if a < b then 1 else "a"

```bash
  Couldn't match expected type `Int' with actual type `[Char]'
  In the expression: "a"
  In the expression: if a < b then 1 else "a"
  In an equation for min': min' a b = if a < b then 1 else "a"
```

また、`then`や`else`の中身が長くなり、一行で書くのが大変な場合は、
`then`と`else`を`if`の書かれている行よりインデントを深くします。

> longString :: String -> String -> String
> longString a b = if a == b
>   then "hogehogehogehogehogehogehogehogehogehogehogehoge"
>   else "fugafugafugafugafugafugafugafugafugafugafugafuga"

関連
----

TODO: あとで別記事にリンク

- パターンマッチ
- case式

参考
----

- 参考URLや文献をlistで記述
- :copy markdownでfirefoxからmarkdown形式でcopy
