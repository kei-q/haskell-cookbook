---
title: 文字を数値に変換する
description: 文字を数値に変換する
tags: string
date: 2013-03-22
---

> import Data.Char

文字を数値に変換するには`Data.Char`の`Data.Char.digitToInt`{.hoogle}を使うのがお手軽です。
この関数なら'a' - 'f'も解釈してくれます。

```bash
ghci> digitToInt '3'
3
ghci> digitToInt 'a'
10
```

一旦文字列にしてから`read`を使うのもお手軽です。

> c2i'' :: Char -> Int
> c2i'' c = read [c]

他には、`ord`{.hoogle}で文字をコードに落として、'0'の値を引く方法もあります。
上記の方法ではparseに失敗したときは例外が発生してしまいますが、この方法なら範囲外の時は自身でMaybeにくるんだりすることができます。

> c2i :: Char -> Maybe Int
> c2i c = if 0 <= n && n <= 9 then Just n else Nothing
>   where n = ord c - ord '0'

`ord`は`fromEnum`でも代用出来ます。こちらだと`Data.Char`をimportせずに済みます。

> c2i' :: Char -> Int
> c2i' c = fromEnum c - fromEnum '0'

