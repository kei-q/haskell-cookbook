---
title: Map型のデータを参照する
description: Mapを参照するための基本的な関数について
tags: containers
date: 2013-03-11
---

> import qualified Data.Map as M

今回のサンプルでは以下のデータを使用します。

> testdata :: M.Map Int String
> testdata = M.fromList [(1,"hoge"), (2,"fuga")]

`key`を渡して対応する値を取得したい場合、以下の関数を使用します。
`lookup`は対応する値がない場合`Nothing`を返し、`findWithDefault`では引数にdefaultの値を指定します。

- `Data.Map.lookup`{.hoogle}
- `Data.Map.findWithDefault`{.hoogle}

```bash
ghci> M.lookup 1 testdata
Just "hoge"

ghci> M.lookup 9 testdata
Nothing

ghci> M.findWithDefault "piyo" 1 testdata
"hoge"

ghci> M.findWithDefault "piyo" 9 testdata
"piyo"
```

`key`が含まれているかどうかは`member`を、その逆は`notMember`を使用します。

- `Data.Map.member`{.hoogle}
- `Data.Map.notMember`{.hoogle}

```bash
ghci> M.member 1 testdata
True

ghci> M.notMember 1 testdata
False
```

データの中身に関係無く、どのくらいのデータが含まれているか確認するには`size`を使います。
空かどうかだけに関心がある場合は`null`のほうが良いでしょう。

- `Data.Map.size`{.hoogle}
- `Data.Map.null`{.hoogle}

```bash
ghci> M.size testdata
2

ghci> M.null testdata
False

ghci> M.null M.empty
True
```

データの`key`の一覧や`value`の一覧が欲しい場合は`elems`, `keys`, `assocs`を使用します。

- `Data.Map.elems`{.hoogle}
- `Data.Map.keys`{.hoogle}
- `Data.Map.assocs`{.hoogle}

```bash
ghci> M.elems testdata
["hoge","fuga"]

ghci> M.keys testdata
[1,2]

ghci> M.assocs testdata
[(1,"hoge"),(2,"fuga")]
```