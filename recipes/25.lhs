---
title: ランダムに値を生成する
description: System.Randomを使って生成します
tags: standard_library, random
date: 2013-01-25
---

ランダムな値を生成するときは[System.Random]をimportし、定義されている関数を使用します。
`randomRIO :: (a,a) -> IO a`を使うと指定した範囲の乱数が取得できます。
randomRIOは実行するたび結果が変わるので、`IO`で包まれています。

```bash
ghci> randomRIO (0,9) :: IO Int
2
it :: Int
```

範囲を指定しない場合は`randomIO`を使うことができます。また、数値にかぎらず、BoolやCharなども
これらのアクションで生成することができます。

```bash
ghci> randomIO :: IO Bool
True
it :: Bool
ghci> randomIO :: IO Char
'\667340'
it :: Char
```

Randomが使用可能な型を確認したいときは[System.Random]のhaddockを参照するか、
以下のように`:i Random`とすると一覧が表示されます。

```bash
ghci> :i Random
class Random a where
  randomR :: RandomGen g => (a, a) -> g -> (a, g)
  random :: RandomGen g => g -> (a, g)
  randomRs :: RandomGen g => (a, a) -> g -> [a]
  randoms :: RandomGen g => g -> [a]
  randomRIO :: (a, a) -> IO a
  randomIO :: IO a
        -- Defined in `System.Random'
instance Random Integer -- Defined in `System.Random'
instance Random Int -- Defined in `System.Random'
instance Random Float -- Defined in `System.Random'
instance Random Double -- Defined in `System.Random'
instance Random Char -- Defined in `System.Random'
instance Random Bool -- Defined in `System.Random'
```

参考
----

- [System.Random]
- [HackageDB: mersenne-random-1.0.0.1][mersenne-random]
- [HackageDB: mersenne-random-pure64-0.2.0.3][mersenne-random-pure64]

[System.Random]: http://lambda.haskell.org/platform/doc/current/packages/random-1.0.1.1/doc/html/System-Random.html
[mersenne-random]: http://hackage.haskell.org/package/mersenne-random
[mersenne-random-pure64]: http://hackage.haskell.org/package/mersenne-random-pure64