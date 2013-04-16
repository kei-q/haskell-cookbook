---
title: Text.ParsecとText.PerserCombinator.Parsecの違いは？
description: Parsecを使いたいとき、どちらを使えば良い？
tags: parsec
date: 2013-04-16
---

2013-04-16現在、標準ライブラリには以下の２つのmoduleをrootとするParsecのライブラリが存在します。
両方ともparsecパッケージが提供しており、どちらを使って良いのか混乱してしまいます。

- `Text.Parsec`
- `Text.PerserCombinator.Parsec`

もしHaskell Platform(GHC)を使用していて、新規に使用する場合は`Text.Parsec`で
構わないようです。こちらが現行のParsecのライブラリのようです。

`Text.PerserCombinator.Parsec`は後方互換性のために用意されているようです。
また、`Text.Parsec`より依存ライブラリが少ないため、GHC以外のHaskell Compilerではこちらのみ
実装されていることもあるようです。

参考
----------

- <http://stackoverflow.com/questions/6029371/whats-the-different-between-text-parsercombinators-parsec-and-text-parsec>
- <http://twilog.org/shelarcy/search?word=Parser+Combinator&ao=a>
