---
title: 外部moduleを使用する
description: importの使い方
tags: import, basics
---

基本

> import Data.List

名前つけ

> import Data.List as L

module名強制

> import qualified Data.List
> import qualified Data.List as L

特定の関数だけ読み込み

> import Data.List (head)

特定の関数*以外*を読み込み

> import Data.List hiding (head)

TODO
----

ghciで読み込んだ時に違いが確認しやすいように
それぞれの例で別のmoduleを読みこむようにする