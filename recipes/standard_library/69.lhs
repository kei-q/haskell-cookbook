---
title: Map型のデータを構築するには
description: Data.MapのfromListを始め、Map型のデータを作る方法
tags: containers
date: 2013-03-10
---

> import Data.Map

fromList
singleton
insert

`Map`のデータを構築するときは`Data.Map.fromList`{.hoogle}がお手軽です。
これは引数に`[(key,value)]`なデータをもとに`Map`のデータを返します。

```bash
ghci> fromList [(1,"hoge"), (2,"fuga")]
fromList [(1,"hoge"),(2,"fuga")]
```

ghciで試した結果は`fromList`という形で表示されますが、型を確認するとちゃんと`Map`が返ってきているのが確認できるかと思います。

`fromList`で同じkeyが複数含まれるデータを渡した場合、最後のデータが優先されます。

```bash
ghci> fromList [(1,"hoge"), (2,"fuga"), (1,"piyo")]
fromList [(1,"piyo"),(2,"fuga")]
```

`fromList`以外には`Data.Map.singleton`{.hoogle}と`Data.Map.insert`{.hoogle}で構築する方法があります。

```bash
ghci> singleton 1 "hoge"
fromList [(1,"hoge")]

ghci> insert 2 "fuga" $ singleton 1 "hoge"
fromList [(1,"hoge"),(2,"fuga")]
```
