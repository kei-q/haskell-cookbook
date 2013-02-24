---
title: Maybeを返す関数をつなげて、全部Justのときだけ値を返したい
description: MaybeのApplicative instanceについて
tags: monad
date: 2013-02-20
---

TODO: 具体的な例に置き換える

`hoge`,`fuga`,`piyo`がそれぞれ`a -> Maybe a`としたとき、

> hoge, fuga, piyo :: a -> Maybe a
> hoge = undefined
> fuga = undefined
> piyo = undefined

順に引数を渡して、全て`Just`だったら最後の結果を返し、途中で`Nothing`だったら
`Nothing`を返すような関数を書きたいとします。
単純な方法では、次のようにpattern matchで全てをチェックします。

> test :: a -> Maybe a
> test a = case hoge a of
>   Nothing -> Nothing
>   Just b -> case fuga b of
>     Nothing -> Nothing
>     Just c -> piyo c

これでは本当に処理したい内容がわかりにくいうえ、関数を増やしたり減らしたりするのが 大変です。
もっと簡潔な書き方として、以下のように書くことができます。

> test' :: a -> Maybe a
> test' a = hoge a >>= fuga >>= piyo

参考
----

- [Control.Monad]

[Control.Monad]: http://www.haskell.org/ghc/docs/latest/html/libraries/base//Control-Monad.html
