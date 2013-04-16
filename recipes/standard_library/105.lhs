---
title: Maybeの中身に関数を適用したい
description: fmap, <$>
tags: maybe
date: 2013-04-15
---

`Maybe`を扱うとき、中身をちょっと加工してから`Maybe`を受け取る別の関数に渡したいことがあるかもしれません。
以下の様な関数を定義しても良いですが、Justをつけたり外したり煩雑です。

> apply :: (a -> b) -> Maybe a -> Maybe b
> apply f (Just a) = Just $ f a
> apply _ Nothing = Nothing

このような場合は`fmap`という汎用的な関数が使えます。
これを使うと、`Maybe`という箱の中身に関数を適用できます。

- `Prelude.fmap`{.hoogle}

```bash
ghci> fmap (+1) (Just 2)
Just 3

ghci> fmap (+1) Nothing
Nothing
```