---
title: 標準添付されているデータ構造のライブラリを知る
description: containersパッケージについて
tags: data_structure
date: 2013-03-09
---

GHCやHaskell-Platformには[containers]というパッケージが同梱されており、この中に基本的なデータ構造のライブラリが含まれています。

- [Data.Map]
    - key-value pairのデータ構造
- [Data.Set]
    - 集合を表すデータ構造
- [Data.IntMap]
    - keyを`Int`に限定して高速にしたData.Map
- [Data.IntSet]
    - 中身`Int`に限定して高速にしたData.Set
- [Data.Sequence]
    - 両端キュー
- [Data.Tree]
    - 木構造
- [Data.Graph]
    - グラフ

MapやSetは、同じ構造をリストで表現することもできますし、`Data.List`に`lookup`, `union`, `intersect`といった関数も用意されています。
しかし、上記のmoduleを使用することで高速な処理が期待出来ますし、何より型が実装の意図をよりわかりやすく伝えてくれます。

[containers]: http://www.haskell.org/ghc/docs/latest/html/libraries/containers/


[Data.Map]: http://www.haskell.org/ghc/docs/latest/html/libraries/containers/Data-Map.html
[Data.Set]: http://www.haskell.org/ghc/docs/latest/html/libraries/containers/Data-Set.html
[Data.IntMap]: http://www.haskell.org/ghc/docs/latest/html/libraries/containers/Data-IntMap.html
[Data.IntSet]: http://www.haskell.org/ghc/docs/latest/html/libraries/containers/Data-IntSet.html
[Data.Sequence]: http://www.haskell.org/ghc/docs/latest/html/libraries/containers/Data-Sequence.html
[Data.Tree]: http://www.haskell.org/ghc/docs/latest/html/libraries/containers/Data-Tree.html
[Data.Graph]: http://www.haskell.org/ghc/docs/latest/html/libraries/containers/Data-Graph.html
