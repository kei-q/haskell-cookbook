---
title: パッケージを使用した具体的なコードが見たいとき
description: Hackage Dependency Monitorの紹介
tags: tool
date: 2013-02-26
---

Haskellでコードを書くとき、現在ではたくさんのパッケージが[HackageDB]に登録されているので、何らかのパッケージを使うことが多いかと思います。
このとき、便利そうなパッケージを見つけたとしても、使い方がよくわからないときがあるかもしれません。
そんなとき、実際にどのように使われているかコードを確認できると捗るかと思います。


そこで便利なのが[Hackage dependency monitor]です。
こちらのサイトでは、あるパッケージを使っているパッケージの一覧を確認することができます。
その依存を辿っていき、実際に使われている箇所を確認すると具体的な例を参照することができます。

例えば、[aesonに依存しているパッケージ一覧](http://packdeps.haskellers.com/reverse/aeson)を確認すると、どのようなパッケージがaesonを使用しているか確認することができます。
これから、気になる名前のパッケージをチェックしたり、比較的新しい情報が欲しい時は高めのversionを指定しているパッケージを調べてみる事で、実際に使われているコードを確認することができます。

参考
----
- [HackageDB]
- [Hackage dependency monitor]

[HackageDB]: http://hackage.haskell.org/packages/hackage.html
[Hackage dependency monitor]: http://packdeps.haskellers.com/