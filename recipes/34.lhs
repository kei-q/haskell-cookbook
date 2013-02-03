---
title: 変数混じりの文字列を(++)でつなげて書くのが面倒くさいのでどうにかする
description: template haskellの力でinterpolated stringsを実現します
tags: string
date: 2013-02-03
---

今回必要な`LANGUAGE`や`import`は以下のとおり。

> {-# LANGUAGE QuasiQuotes, ExtendedDefaultRules #-}
> module R20130203 where
> import Text.InterpolatedString.Perl6

Haskellのコードで変数を文字列に変換するとき、以下の様なコードを目にすることがあります。
変数をそれぞれ`show`により文字列に変換し、それを連結して一つの文字列にしています。

> showPos :: Int -> Int -> String
> showPos x y = "Pos: (" ++ show x ++ "," ++ show y ++ ")"

この方法は書くのも手間ですし、読みづらいコードでもあります。
長い文字列や頻繁に評価されるコードだと、文字列連結のコストも気になるところです。

ところで、perlやrubyなどでは以下のように、文字列の中に変数を埋め込み、展開することができます。

```ruby
x = 1
y = 2
str = "Pos: (#{x},#{y})" #=> "Pos: (1,2)"
```

hackageを探すと、このような文字列を実現するためのpackageがいくつか見つかります。

- [Interpolation]
- [interpolatedstring-perl6]
- [interpolatedstring-qq]

今回は、この中から[Interpolatedstring-perl6]を使用してみます。
まずはhackageから必要なpackageをinstallします。

```bash
$ cabal update
$ cabal install interpolatedstring-perl6
```

このpackageを使って前述の`showPos`を書き直すと以下のようになります。
余計な`"`や`++`が減っているのがわかるとおもいます。

> showPos' :: Int -> Int -> String
> showPos' x y = [qc|Pos: ({x},{y})|]

参考
----

- [String interpolation - Wikipedia, the free encyclopedia](http://en.wikipedia.org/wiki/String_interpolation)

[Interpolation]: http://hackage.haskell.org/package/Interpolation
[interpolatedstring-perl6]: http://hackage.haskell.org/package/interpolatedstring-perl6
[interpolatedstring-qq]: http://hackage.haskell.org/package/interpolatedstring-qq