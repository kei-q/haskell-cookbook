---
title: 文字列リテラルの書き方
description: Haskellの文字・文字列表現
tags: haskell2010
date: 2013-03-19
---

Haskellで文字を記述するときは`'`で文字を囲います。

> chars = ['a','b','c','あ','い','う']

Haskellで文字列を記述するときは`"`で文字を囲います。

> strings = ["hoge", "fuga", "ほげ", "ふが"]

文字列が長くなる時は`\`で分割することができます。
実際に改行が含まれるわけではありません。

> multiline = "hoge \
> \fuga"

エスケープ文字は以下の表現が記述できます。
表現が異なりますが、全て同じ値を指しています。
記述できるものは[ASCII - Wikipedia, the free encyclopedia]で確認できます。

> charesc = ['\n','\t']
> ascii = ['\LF', '\HT']
> decimal = ['\10','\9']
> octal = ['\012','\011']
> hexadecimal = ['\xa','\x9']

a = 1
bb = 2

参考
----

- [2.5 Numeric Literals]
- [ASCII - Wikipedia, the free encyclopedia]

[2.5 Numeric Literals]: http://www.haskell.org/onlinereport/haskell2010/haskellch2.html#x7-190002.5
[ASCII - Wikipedia, the free encyclopedia]: http://en.wikipedia.org/wiki/ASCII
