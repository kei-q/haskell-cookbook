---
title: リストをindex付きで処理する
description: zipを使ってリストに番号を付けます
tags: list
date: 2013-01-17
---

> module R20130117 where

> list :: [String]
> list = ["hoge", "fuga", "piyo"]

readFileで取得し、linesで生成したリストに行番号をつけるなど、リストに対し番号を付けたいことがあります。
そのような場合、`zip :: [a] -> [b] -> [(a,b)]`を使うと実現出来ます。

> -- |
> -- >>> zip [1..] list
> -- [(1,"hoge"),(2,"fuga"),(3,"piyo")]

最初の引数に無限リストを指定していますが、zipは長さの短い方に合わせるので、
この書き方で問題ありません。

他にも、リストの奇数番目だけを取り出したリストは以下のように書くことができます。

> -- |
> -- >>> map snd $ filter (\(n,_) -> n`mod`2==1) $ zip [1..] list
> -- ["hoge","piyo"]

参考
----
