---
title: 入れ子のリストを平らにする
description: concat
tags: list
date: 2013-03-08
---

リストを平らにするには`concat`{.hoogle}を使います。

```bash
ghci> concat [[1,2],[3,4]]
[1,2,3,4]
```

`map`{.hoogle}に`a -> [a]`のような関数を適用したあと、`concat`するパターンがよくあります。そのための関数として`concatMap`{.hoogle}が用意されています。

```bash
ghci> concatMap (\x -> [x,-x]) [1..3]
[1,-1,2,-2,3,-3]
```

参考
----

- [Data.List](http://lambda.haskell.org/platform/doc/current/ghc-doc/libraries/haskell2010-1.1.0.1/Data-List.html#v:concat)