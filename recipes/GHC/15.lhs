---
title: GHCで生成した実行ファイルを小さくしたい
description: stripコマンドで不要なシンボルを削除します
tags: tool
date: 2013-01-15
---

以下の様な"Hello World"を出力するだけのプログラムがあるとします。

```haskell
main = putStrLn "Hello World"
```

こちらをghcでコンパイルすると、びっくりするようなサイズの実行ファイルが生成されます。

```bash
$ ghc --make Main.hs
Linking Main ...
$ ll *(x)
-rwxr-xr-x  1 keqh  staff  8242296  1 15 09:09 Main
```

LinuxやMacでは`strip`というコマンドがあるので、こちらを使うと
実行ファイルのサイズを小さくすることができます。
例えば、今回のプログラムではおよそ半分近くまでサイズが小さくなっています。

```bash
$ strip Main -o MainS
$ ll *(x)
-rwxr-xr-x  1 keqh  staff  8242296  1 15 09:09 Main
-rwxr-xr-x  1 keqh  staff  4668432  1 15 09:09 MainS
```

参考
----

- [linker - Making small haskell executables? - Stack Overflow](http://stackoverflow.com/questions/699908/making-small-haskell-executables)
- [6.3. より小さく: 小さいプログラムを作る](http://www.kotha.net/ghcguide_ja/latest/smaller.html)