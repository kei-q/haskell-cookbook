---
title: N進数の相互変換を行う
description: lensパッケージのNumeric.Lensを使用します
tags: lens, num
date: 2013-02-12
---

数値をN進数表現の文字列に、またその逆を行うには[lens]にふくまれる[Numeric.Lens]が便利です。
2-36進数の範囲で相互に変換するための関数が用意されています。

以下は文字列を数値に変換する例です。結果は`Maybe Integer`として返ってきます。
これは、文字列の中に指定したN進数で表現できない文字が含まれている場合、
Nothingとなるためです。

```bash
ghci> "100" ^? base 2
Just 4
it :: Maybe Integer
ghci> "100" ^? base 8
Just 64
it :: Maybe Integer
ghci> "100" ^? base 16
Just 256
it :: Maybe Integer
ghci> "100" ^? base 36
Just 1296
it :: Maybe Integer
```

逆に、数値をN進数の文字列に変換する例は以下のとおりです。
こちらは必ず変換できるため、`String`が返ってきます。

```bash
ghci> 100 ^. re (base 2)
"1100100"
it :: String
ghci> 100 ^. re (base 8)
"144"
it :: String
ghci> 100 ^. re (base 16)
"64"
it :: String
ghci> 100 ^. re (base 36)
"2s"
it :: String
```

両方とも2-36の範囲で変換することができ、もし範囲外の数値を渡すと実行時エラーになってしまいます。

参考
----

[lens]: http://hackage.haskell.org/package/lens-3.8.5
[Numeric.Lens]: http://hackage.haskell.org/packages/archive/lens/3.8.5/doc/html/Numeric-Lens.html
