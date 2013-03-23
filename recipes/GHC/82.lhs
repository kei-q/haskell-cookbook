---
title: 一定時間処理を停止するには
description: sleepする方法
tags: IO, GHC
date: 2013-03-23
---

> import Control.Concurrent

一定時間処理を停止させたいときは以下のアクションを使用します。

- `Control.Concurrent.threadDelay`{.hoogle}

最初の引数にはsleepする時間をマイクロ秒で指定します。
以下は3秒待ってから文字列を出力する例です。

> main :: IO ()
> main = do
>     threadDelay 3000000
>     putStrLn "hoge"