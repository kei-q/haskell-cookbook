---
title: ファイルパスを扱う
description: System.FilePathの扱い方
tags: standard-library
date: 2013-03-07
---

Haskellではファイルのパスを扱うための便利な関数を提供するパッケージとして[filepath]が用意されています。
これを使用するには、以下のmoduleをimportします。

> import System.FilePath

ディレクトリ名を表す文字列と、ファイル名を表す文字列があり、これをつなげてファイルパスを表す文字列を作りたいとします。

> dir = "/User/keqh"
> file = "hoge.txt"

文字列を連結する`(++)`を使って、以下のようにすることもできます。
出力結果を見ると期待通りのものが得られているように見えます。

```bash
ghci> dir ++ "/" ++ file
"/User/keqh/hoge.txt"
```

しかし、これには問題があります。一つは`dir`の末尾に"/"があるかどうか知っている必要が有ること。もう一つは、このコードはwindowsでは期待したものにならないことです。

[filepath]パッケージの関数を使うと以下のようになります。
コード上では文字列連結の部分を`(</>)`という演算子に置き換えただけに見えますが、前述の問題を解決しています。
試しに末尾に余計な"/"をつけても重なることはありませんし、windows上で試せば適切な結果が返ってくるはずです。

```bash
ghci> dir </> file
"/User/keqh/hoge.txt"

ghci> "/User/keqh/" </> file
"/User/keqh/hoge.txt"
```

参考
----

- [filepath]

[filepath]: http://hackage.haskell.org/package/filepath