---
title: 関数を演算子のように使う
description: 関数を中置演算として書く方法
tags: haskell2010
date: 2013-03-21
---

関数は'`'で囲うことで演算子のように引数の間に置くことができます。
以下の２つはどちらも同じ評価結果を出力しています。

```bash
ghci> elem 1 [1,2]
True

ghci> 1 `elem` [1,2]
True
```

部分適用も可能です。

```bash
ghci> :t (1 `elem`)
(1 `elem`) :: (Eq a, Num a) => [a] -> Bool

ghci> :t (`elem` [1,2])
(`elem` [1,2]) :: (Eq a, Num a) => a -> Bool
```

特に宣言しなければinfixl, 優先度は最高とみなされます。

参考
-----

- すごいHaskell楽しく学ぼう: 1.1 関数呼び出し
- [3.2 Variables, Constructors, Operators, and Literals]

[3.2 Variables, Constructors, Operators, and Literals]: http://www.haskell.org/onlinereport/haskell2010/haskellch3.html#x8-240003.2