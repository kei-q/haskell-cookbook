---
title: アクションをN回繰り返す
description: Control.Monadに定義されている関数を使います
tags: monad
date: 2013-02-13
---

今回使用するmoduleは以下のとおりです。

> import Control.Monad (replicateM, mapM, forM)

アクションをN回繰り返したいときは[Control.Monad]にある`replicateM`を使用します。

```bash
ghci> replicateM 3 $ putStrLn "test"
test
test
test
```

indexつきで繰り返したいときは、整数のリストを併用して`mapM`や`forM`を使用します。
`forM`は`mapM`の引数を入れ替えたものです。
第二引数が長くなる場合はこちらを使用するとわかりやすくなるかとおもいます。

```bash
ghci> mapM (\i -> putStrLn ("index: " ++ show i)) [1..3]
index: 1
index: 2
index: 3

ghci> forM [1..3] $ \i -> putStrLn ("index: " ++ show i)
index: 1
index: 2
index: 3
```

参考
----

- [Control.Monad]

[Control.Monad]: http://www.haskell.org/ghc/docs/latest/html/libraries/base//Control-Monad.html
