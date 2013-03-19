---
title: ghciでgetArgsの挙動を確認する
description: :mainの使い方
tags: ghci
date: 2013-03-16
---

> import System.Environment

以下のようにコマンドライン引数から値を取得するコードを書いているとします。

> main :: IO ()
> main = do
>   args <- getArgs
>   print args

ghci上で`main`をそのまま読んでも`getArgs`に値を渡せませんが、`:main`コマンドを用いることでgetArgsの挙動をghciで確認することができます。

```bash
> main
[]

ghci> :main 1 2 3
["1","2","3"]
```
