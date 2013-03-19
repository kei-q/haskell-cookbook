---
title: Mapのtraversal処理
description: map、foldなど
tags: containers
date: 2013-03-15
---

> import Data.Map (Map)
> import qualified Data.Map as M
> import Data.Char (toUpper)

今回のサンプルでは以下のデータを使用します。

> testdata :: M.Map Int String
> testdata = M.fromList [(1,"hoge"), (2,"fuga")]

`Map`にもList操作で定番の`map`や`fold`が用意されています。

- map :: (a -> b) -> Map k a -> Map k b
- `Data.Map.foldl`{.hoogle}
- `Data.Map.foldr`{.hoogle}

```bash
ghci> M.map (map toUpper) testdata
fromList [(1,"HOGE"),(2,"FUGA")]

ghci> M.foldl (++) "" testdata
"hogefuga"

ghci> M.foldr (++) "" testdata
"hogefuga"
```

各要素のvalueに対して評価しますが、`-WithKey`という関数を使用すると
keyを含めた関数を指定出来ます。`foldlWithKey`と`foldrWithKey`で渡す関数の引数の順番が異なることに注意。

- `Data.Map.mapWithKey`{.hoogle}
- `Data.Map.foldlWithKey`{.hoogle}
- `Data.Map.foldrWithKey`{.hoogle}

```bash
ghci> M.mapWithKey (\k v -> show k ++ v) testdata
fromList [(1,"1hoge"),(2,"2fuga")]

ghci> M.foldlWithKey (\a k b -> if even k then a ++ b else a) "" testdata
"fuga"

ghci> M.foldrWithKey (\k a b -> if even k then a ++ b else b) "" testdata
"fuga"
```