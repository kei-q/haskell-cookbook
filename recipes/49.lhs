---
title: Maybeをパターンマッチで展開するのが面倒なのでなんとかしたい
description: Data.Maybeに定義されている各種関数をつかいます
tags: base
date: 2013-02-18
---

> import Data.Maybe (fromMaybe, maybe)

`fromMaybe :: a -> Maybe a -> a`を使うと、Maybeの中身を取り出しつつ、`Nothing`だったときの値を指定することができます。

```bash
ghci> fromMaybe 1 Nothing
1
ghci> fromMaybe 1 (Just 2)
2
```

`maybe :: b -> (a -> b) -> Maybe a -> b`は値が`Just`だったときに指定した関数を評価するものです。
以下は数値が返ってきたらその文字列表現を返し、`Nothing`であれば"_"を返す例です。

```bash
ghci> maybe "_" show (Just 2)
"2"
ghci> maybe "_" show Nothing
"_"
```

`Just`であれば関数を適用して、`Nothing`であればそのままにしたい場合は`fmap :: (a -> b) -> f a -> f b`を使用します。

```bash
ghci> fmap (+1) (Just 1)
Just 2
it :: Maybe Integer
ghci> fmap (+1) Nothing
Nothing
it :: Maybe Integer
```

参考
----

- [Data.Maybe]

[Data.Maybe]: http://lambda.haskell.org/platform/doc/current/ghc-doc/libraries/haskell2010-1.1.0.1/Data-Maybe.html