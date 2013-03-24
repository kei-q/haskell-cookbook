---
title: Set型のデータを構築するには
description: Set型のデータを作る方法
tags: containers
date: 2013-03-24
---

> import qualified Data.Set as S

`Set`のデータを構築するときは`Data.Set.fromList`{.hoogle}がお手軽です。
これは引数に`[value]`なデータをもとに`Set`のデータを返します。

```bash
ghci> S.fromList ["hoge","fuga"]
fromList ["fuga","hoge"]
```

ghciで試した結果は`fromList`という形で表示されますが、型を確認するとちゃんと`Set`が返ってきているのが確認できるかと思います。

`fromList`で同じkeyが複数含まれるデータを渡した場合、データが重複して含まれることはありません。

```bash
ghci> S.fromList ["hoge", "fuga", "hoge"]
fromList ["fuga","hoge"]
```

`fromList`以外には`Data.Set.empty`{.hoogle}と`Data.Set.insert`{.hoogle}で構築する方法があります。

```bash
ghci> S.empty
fromList []

ghci> S.insert "fuga" $ S.empty
fromList ["fuga"]
```
