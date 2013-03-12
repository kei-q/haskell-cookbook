---
title: Mapにデータを挿入する
description: insert系の関数について
tags: containers
date: 2013-03-12
---

> import qualified Data.Map as M

今回のサンプルでは以下のデータを使用します。

> testdata :: M.Map Int String
> testdata = M.fromList [(1,"hoge"), (2,"fuga")]

`Map`にデータを挿入する関数は以下のものが定義されています。

- `Data.Map.insert`{.hoogle}
    - key, valueを一組挿入する。keyが重複した場合は上書き
- `Data.Map.insertWith`{.hoogle}
    - insertと同様。ただしkeyが重複した時の処理を関数で指定する
- `Data.Map.insertWithKey`{.hoogle}
    - insertWithの重複したときの関数にkeyの値が含まれる
- `Data.Map.insertlookupWithKey`{.hoogle}
    - insertWithKey + lookup

それぞれの関数の評価例は以下のとおりです。

```bash
ghci> M.insert 3 "piyo" testdata
fromList [(1,"hoge"),(2,"fuga"),(3,"piyo")]

ghci> M.insertWith (++) 2 "piyo" testdata
fromList [(1,"hoge"),(2,"piyofuga")]

ghci> M.insertWithKey (\k newValue oldValue -> show k ++ newValue ++ "," ++ oldValue) 2 "piyo" testdata
fromList [(1,"hoge"),(2,"2piyo,fuga")]

ghci> M.insertLookupWithKey (\k newValue oldValue -> show k ++ newValue ++ "," ++ oldValue) 2 "piyo" testdata
(Just "fuga",fromList [(1,"hoge"),(2,"2piyo,fuga")])
```
