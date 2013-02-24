---
title: 複数のMaybeのうち、最初に該当したものを返す
description: MaybeのAlternative instanceについて
tags: base, applicative, alternative
date: 2013-02-19
---

> import Control.Applicative ((<|>))

あるMaybeを返す関数(`hoge`,`fuga`,`piyo`)があるとして、最初に`Just a`を返した
値を全体の結果とするような関数があったとします。
単純な方法では、以下のようにパターンマッチを使うものがありますが、
Indentがかなり深い上に、関数を増やしたり減らしたりといった変更に弱い関数になっています。

> test :: a -> a
> test z = case hoge of
>   Just a -> a
>   Nothing -> case fuga of
>     Just b -> b
>     Nothing -> case piyo of
>       Just c -> c
>       Nothing -> z

上記のような定義を書くと、`fromMaybe`を使うよう警告がでるかもしれません。
しかし、上記のようなケースに対してfromMaybeを使うと、以下のように
評価順や最後の値がどれになるのかわかりにくいものになってしまいます。

> test' z = fromMaybe (fromMaybe (fromMaybe z piyo) fuga) hoge

このような場合は、[Control.Applicative]に定義されている`Alternative`を使用します。
すると、これまでの関数は以下のように書き換えることができます。

> test'' z = hoge <|> fuga <|> piyo <|> Just z

参考
----

- [Control.Applicative]

[Control.Applicative]: http://hackage.haskell.org/packages/archive/base/latest/doc/html/Control-Applicative.html#t:Alternative
