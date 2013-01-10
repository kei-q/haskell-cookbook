---
title: 標準ライブラリにある関数を見つけたい
description: hoogleを使って関数を調べます
tags: tool
---

標準ライブラリは [Haskell Hierarchical Libraries](http://www.haskell.org/ghc/docs/latest/html/libraries/) で探すことができます。
階層化されたライブラリのこのドキュメントは予め使いたいものの予測がついている時には
探すことができますが、目星がないときにはなかなか探しづらいものです。

関数を検索するツールとしては[Hoogle](http://www.haskell.org/hoogle/)があります。
これを使うと、標準ライブラリに含まれている関数を関数の名前だけでなく、型で検索することができます。

例えば、文字列を分割する関数を探したい、と言う場合、`String -> [String]`という
型が思いつきます。これをhoogleで検索した結果が以下になります。

[String -> [String] - Hoogle](http://www.haskell.org/hoogle/?hoogle=String+-%3E+%5BString%5D)

おそらく、上位に`lines`や`words`など、文字列を分割する関数が出てきたと思います。
ちなみにlinesは行に分割する関数、wordsは単語に分割する関数です。

型で検索するときは、一見入力下型と異なる結果が表示されることがあります。
例えば、文字列を連結したいと思い、以下のqueryで検索したとします。

[String -> String -> String - Hoogle](http://www.haskell.org/hoogle/?hoogle=String+-%3E+String+-%3E+String)

このとき、検索結果には`FilePath`や`[a]`などが表示されています。
これは、`FilePath`が以下のように定義されており、Stringの別名となっていたり、
`String`は文字のリスト、つまり`[Char]`と定義されていてリストの関数も
ヒットするためです。もちろん、検索に出てきた関数を使うこともできます。

> type FilePath = String
> type String = [Char]

もちろん、関数の名前でも検索できますし、演算子やdataも検索できます。

- [map - Hoogle](http://www.haskell.org/hoogle/?hoogle=map)
- [++ - Hoogle](http://www.haskell.org/hoogle/?hoogle=%2B%2B)
- [Maybe - Hoogle](http://www.haskell.org/hoogle/?hoogle=Maybe)

よく有りそうなちょっとしたコードを書こうとしたときは、その関数の型を
hoogleにいれてみると、欲しい関数が見つかるかもしれません。

参考
----

- [Hoogle - HaskellWiki](http://www.haskell.org/haskellwiki/Hoogle)

TODO
----

- localでhoogle
- hayoo
- haddock
