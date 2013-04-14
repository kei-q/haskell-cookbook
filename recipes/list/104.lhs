---
title: ある要素がリストの何番目にあるか知りたい
description: elemIndex,elemIndices, findIndex, findIndicesの使い方
tags: list
date: 2013-04-14
---

> import Data.List
> improt Data.Char

ある要素がリストの何番目にあるか知りたいときは以下の関数を使用します。

- `Data.List.elemIndex`{.hoogle}
- `Data.List.elemIndices`{.hoogle}
- `Data.List.findIndex`{.hoogle}
- `Data.List.findIndices`{.hoogle}

最初の値だけ必要なときは`...Index`、全て知りたいときは`...Indices`を使います。

```bash
ghci> elemIndex 'o' "hoge fuga piyo"
Just 1

ghci> elemIndices 'o' "hoge fuga piyo"
[1,13]
```

探しだす条件を「ある値に一致するか」ではなく、条件を指定したいときは`find...`を使います。

```bash
ghci> findIndex isUpper "Hoge Fuga Piyo"
Just 0

ghci> findIndices isUpper "Hoge Fuga Piyo"
[0,5,10]
```