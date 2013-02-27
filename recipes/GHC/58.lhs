---
title: exportしていない関数をghciで試したい
description: :module *hogeの使い方
tags: ghci
date: 2013-02-27
---

以下のようなコードをghciで確認しているとします。
ここでは２つのmoduleが存在し、`Main`が`Sub`を利用しています。
Subは２つの関数を定義し、そのうち一つ(`f`)だけを公開しています。

```haskell
module Main(main) where

import Sub

main :: IO ()
main = print $ f 10
```

```haskell
module Sub(f) where

f n | n >= 0 = g n
    | otherwise = n

g = undefined
```

もし、`Sub`で定義した公開していない関数(`g`)の動作が怪しくてghciで確認したいとき、どうすればいいでしょうか。
次のように`g`も公開してしまえば確かに`g`を外部から評価できますが、不要に関数を公開することになってしまいます。
こうなると名前の衝突やコンパイル次の依存関係の処理など、たた不都合なことがあります。

```haskell
module Sub(f,g) where
...
```

このようなときは`:module *<module>`を使用します。
このコマンドによりmoduleを追加すると、対象のmoduleのトップレベルの定義が全て参照できるようになります。
そのようなmoduleはプロンプトでは`*`がmodule名の先頭につきます。

```bash
$ ghci Main.hs
...
[*Main]
> :type g

<interactive>:1:1: Not in scope: `g'

[*Main]
> :module +*Sub

[*Sub *Main]
> :type g
g :: Int -> Int
```

なお、`ghci <file>`でghciを実行したときは対象のファイルのトップレベルが参照出来る状態になっています。
そのため、上記の例では`Main` moduleにも`*`がついています。

参考
----

[2.4. プロンプトで対話的に評価する](http://www.kotha.net/ghcguide_ja/latest/interactive-evaluation.html#ghci-scope)