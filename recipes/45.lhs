---
title: 処理を一定時間停止させたい
description: Control.ConcurrentのthreadDelayを使用します
tags: base
date: 2013-02-14
---

[Control.Concurrent]の`threadDelay :: Int -> IO ()`を使用します。
最初の引数にはマイクロ秒で止めたい時間を指定します。

```bash
ghci> threadDelay $ 1000 * 1000
---- ここで一秒の待ちが入る
it :: ()
```

参考
----

[Control.Concurrent]: http://hackage.haskell.org/packages/archive/base/latest/doc/html/Control-Concurrent.html#v:threadDelay