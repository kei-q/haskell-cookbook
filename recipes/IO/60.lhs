---
title: 標準入力から値を受け取る
description: getChar, getLine, getContentsについて
tags: prelude
date: 2013-03-01
---

Haskellで標準入力から読み込むための基本的なアクションは以下の３つです。

- `getChar`{.hoogle} : 一文字読み込み
- `getLine`{.hoogle} : 一行読み込み
- `getContents`{.hoogle} : すべての入力を読み込み

サンプルとして、以下の様なアクションを考えてみます。

> main :: IO ()
> main = do
>     c <- getChar
>     s <- getLine
>     contents <- getContents
>     print (c,s,contents)

これに"hoge\nfuga"のような文字列を与えると以下の様な結果が返ってきます。

```bash
$ echo "hoge\nfuga" | runghc Main.hs
('h',"oge","fuga\n")
```

最初の'h'は`getChar`によって文字がひとつ読み取られています。
次の"oge"は、残りの入力から改行文字までを読み取り、文字列として返しています。このとき、改行文字は結果に含まれません。
最後に、残りの入力全てが`getContents`により読み取られています。

参考
----

- [Prelude]

[Prelude]: http://www.haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#g:26