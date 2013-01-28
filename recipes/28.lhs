---
title: 文字の種類を判定する
description: Data.Charをつかって文字種を判定します
tags: basics
date: 2013-01-28
---

今回使用するアクションは以下のmoduleのimportが必要です。

> import Data.Char

`Char`がどのような文字種か判定するための関数が[Data.Char]に用意されています。
例えば、文字列に含まれる文字が全てalphabetか確認したいときは、`isAlpha :: Char -> Bool`を
`all :: (a -> Bool) -> [a] -> Bool`と組み合わせて使うことができます。

```bash
ghci> :t all
all :: (a -> Bool) -> [a] -> Bool
ghci> all isAlpha "test"
True
it :: Bool
ghci> all isAlpha "this is a pen."
False
it :: Bool
```

単純な例では[Data.Char]に含まれる関数を使うのが簡単ですが、複雑な条件になる場合は
[Text.Parsec]といったライブラリを使用したほうが良いでしょう。

参考
----

- [Data.Char]
- [Text.Parsec]

[Data.Char]: http://lambda.haskell.org/platform/doc/current/ghc-doc/libraries/haskell2010-1.1.0.1/Data-Char.html
[Text.Parsec]: http://lambda.haskell.org/platform/doc/current/packages/parsec-3.1.3/doc/html/Text-Parsec.html