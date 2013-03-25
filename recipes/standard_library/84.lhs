---
title: Set型のデータを参照する
description: Setを参照するための基本的な関数について
tags: containers
date: 2013-03-25
---

> import qualified Data.Set as S

今回のサンプルでは以下のデータを使用します。

> testdata :: S.Set String
> testdata = S.fromList ["hoge", "fuga"]

`Set`にある値が含まれているか調べたいときは、以下の関数を使用します。

- `Data.Set.member`{.hoogle}
- `Data.Set.notMember`{.hoogle}

```bash
ghci> S.member "hoge" testdata
True

ghci> S.notMember "hoge" testdata
False
```

データの中身に関係無く、どのくらいのデータが含まれているか確認するには`size`を使います。
空かどうかだけに関心がある場合は`null`のほうが良いでしょう。

- `Data.Set.size`{.hoogle}
- `Data.Set.null`{.hoogle}

```bash
ghci> S.size testdata
2

ghci> S.null testdata
False

ghci> S.null S.empty
True
```

ある`Set`が一方の`Set`の部分集合かどうか調べたいときは以下の関数を使用します。
`isProperSubsetOf`は同じ集合の時は`False`を返します。

- `Data.Set.isSubsetOf`{.hoogle}
- `Data.Set.isProperSubsetOf`{.hoogle}

```bash
ghci> (S.fromList ["hoge"]) `S.isSubsetOf` testdata
True

ghci> (S.fromList ["hoge", "fuga"]) `S.isSubsetOf` testdata
True

ghci> (S.fromList ["hoge", "fuga"]) `S.isProperSubsetOf` testdata
False
```
