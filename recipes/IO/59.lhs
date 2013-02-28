---
title: 標準出力に出力する
description: putChar, putStr, putStrLn, printの使い方
tags: prelude
date: 2013-02-28
---

Haskellで標準出力に値を書き込むには以下の関数を使用します。

- `putStr`{.hoogle} : 文字列を標準出力に書き込む
- `putStrLn`{.hoogle} : putStr + 改行文字
- `print`{.hoogle} : putStrLn . show
- `putChar`{.hoogle} : 文字を標準出力に書き込む

それぞれのアクションは以下のように使うことができます。

> main :: IO ()
> main = do
>     putStr "テスト"
>     putStrLn "改行込み"
>     print 1
>     putChar 'a'

実行した結果はそれぞれ以下の通りです。
putStrでは改行が含まれないので、次の出力が同じ行に表示されています。

```bash
ghci> main
テスト改行込み
1
a
```

参考
----

- [Prelude]

[Prelude]: http://www.haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#g:26