---
title: 数値のリテラルの書き方
description: Haskellの数値表現
tags: haskell2010
date: 2013-03-18
---

Haskellでは以下の数値リテラルを記述できます。
16,8進数のalphabetは大文字小文字どちらでも構いません。
浮動小数点数は10進数のみです。

- 10進数
    - 123, -98, 1125899906842624
- 16進数
    - 0xaf, 0Xaf, 0xAF, 0XAF
- 8進数
    - 0o37, 0O37
- 浮動小数点数
    - 1.1, 1.1e3, 1.1e-3, 2e10

参考
----

[2.5 Numeric Literals]: http://www.haskell.org/onlinereport/haskell2010/haskellch2.html#x7-190002.5