---
title: Mapにデータを更新・削除する
description: Mapの更新・削除系の関数について
tags: containers
date: 2013-03-13
---

> import Data.Map (Map)
> import qualified Data.Map as M

今回のサンプルでは以下のデータを使用します。

> testdata :: M.Map Int String
> testdata = M.fromList [(1,"hoge"), (2,"fuga")]

- `Data.Map.delete`{.hoogle}
- `Data.Map.adjust`{.hoogle}
- `Data.Map.adjustWithKey`{.hoogle}
- `Data.Map.update`{.hoogle}
- `Data.Map.updateWithKey`{.hoogle}
- `Data.Map.updateLookupWithKey`{.hoogle}
- `Data.Map.alter`{.hoogle}

データを削除するには`delete`を使います。
引数には削除したいデータのkeyを指定します。

```bash
ghci> M.delete 1 testdata
fromList [(2,"fuga")]
```

データの更新には`adjust`, `update`を使用します。
`adjust`はvalueを更新するための関数を最初に渡しますが、
`update`はその関数の最後の型が`Maybe a`になっています。
`Just`のときは`adjust`と同様の動作ですが、`Nothing`のときは値を削除します。
両方とも更新対象のデータが見付からなければ何もしません。

```bash
ghci> M.adjust ("update: "++) 1 testdata
fromList [(1,"update: hoge"),(2,"fuga")]

ghci> M.update (Just . ("update: "++)) 1 testdata
fromList [(1,"update: hoge"),(2,"fuga")]

ghci> M.adjust ("update: "++) 3 testdata
fromList [(1,"hoge"),(2,"fuga")]

ghci> M.update (Just . ("update: "++)) 3 testdata
fromList [(1,"hoge"),(2,"fuga")]

ghci> M.update (const Nothing) 1 testdata
fromList [(2,"fuga")]
```

`adjustWithKey`や`updateWithKey`は上記の関数の最初の引数にkeyの情報も含まれていること以外は同様です。

```bash
ghci> M.adjustWithKey (\k v -> show k ++ ": " ++ v) 1 testdata
fromList [(1,"1: hoge"),(2,"fuga")]

ghci> M.updateWithKey (\k v -> Just $ show k ++ ": " ++ v) 1 testdata
fromList [(1,"1: hoge"),(2,"fuga")]
```

`alter`は`adjust`や`update`と型が似ていますが、引数の最初の型が`Maybe a -> Maybe a`なところが異なっています。
この関数は`delete`, `adjust`, `update`を一般化したようなもので、これまでに
登場した関数は以下のように`alter`で定義できます。

> delete' :: Ord k => k -> Map k a -> Map k a
> delete' = M.alter f
>   where f _ = Nothing
> adjust' :: Ord k => (a -> a) -> k -> Map k a -> Map k a
> adjust' f = M.alter (fmap f)
> update' :: Ord k => (a -> Maybe a) -> k -> Map k a -> Map k a
> update' f = M.alter g
>   where g (Just a) = f a
>         g Nothing = Nothing
