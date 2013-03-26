---
title: Setにデータを挿入する
description: insert系の関数について
tags: containers
date: 2013-03-26
---

> import qualified Data.Set as S

今回のサンプルでは以下のデータを使用します。

> testdata :: S.Set String
> testdata = S.fromList ["hoge", "fuga"]

`Set`にデータを挿入する関数は以下のものが定義されています。
`Map`はいくつか`insert`に種類がありましたが、`Set`では１つだけです。

- `Data.Set.insert`{.hoogle}

`insert`の評価例は以下のとおりです。

```bash
ghci> S.insert "piyo" testdata
fromList ["fuga","hoge","piyo"]

ghci> S.insert "fuga" testdata
fromList ["fuga","hoge"]
```
