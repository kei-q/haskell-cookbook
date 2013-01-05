---
title: 文字列を連結する
description: test
tags: String
---

> module AppendString where

> import Data.Monoid

> s1 = "hoge"
> s2 = "fuga"

文字列を連結するには,

> -- |
> -- >>> s1 ++ s2
> -- "hogefuga"

他にも

> -- |
> -- >>> s1 <> s2
> -- "hogefuga"
