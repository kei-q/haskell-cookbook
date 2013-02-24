---
title: 関数の途中で値がどうなっているのか見たい
description: Debug.Traceのtraceを使います
tags: base
date: 2013-02-15
---

> import Debug.Trace

プログラミングの最中、デバッグのために途中で値がどうなっているか確認したい時があります。
`print`や`putStrLn`で値を表示してもよいですが、これらを使うためには関数を`IO`で
包む必要があります。
このようなときは`trace :: String -> a -> a`が使えます。
trace

> f x = trace ("input: " ++ show x) $ x + 1

上記のような関数を実行すると以下のようにtraceに渡した文字列が表示されます。

```bash
ghci> f 10
input: 10
11
it :: Integer
```

この関数はデバッグ用途のために用意された関数なので、画面に文字列を表示する用途として
使用してはいけません。

参考
----

