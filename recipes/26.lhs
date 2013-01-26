---
title: 乱数を高速に生成する(SFMT編)
description: mersenne-randomパッケージを使って乱数を生成します
tags: random
date: 2013-01-26
---

[System.Random]でランダムな値を生成することができますが、あまり速いとはいえません。
ゲームやレイトレーシングなど乱数を多用する処理では、System.Randomによる乱数生成が
ボトルネックになる可能性があります。

今回は、SFMTという高速な乱数生成アルゴリズムを使用するパッケージの[mersenne-random]を紹介します。
以下のコマンドでパッケージをインストールします。

```bash
$ cabal insatll mersenne-random -fuse_sse2
```

`random :: MTGen -> IO a`を使って乱数を生成します。
乱数の種は`getStdGen :: IO MTGen`で生成するか、`newMTGen :: Maybe Word32 -> IO MTGen`で
自分で指定します。

```bash
ghci> g <- getStdGen
g :: MTGen
ghci> random g :: IO Int
-2516471217048911504
it :: Int
ghci> random g :: IO Double
0.4363048871523597
it :: Double
ghci> random g :: IO Bool
True
it :: Bool
```

`randoms :: MTGen -> IO [a]`を使うと乱数が無限リストとして得られます。

```bash
ghci> ls <- randoms g :: IO [Double]
ls :: [Double]
ghci> take 3 ls
[0.4333918718049294,0.7892844767968221,0.6355040554442073]
it :: [Double]
```

利便性のために`randomIO :: IO a`というアクションも用意されているようです。
ただし、他のアクションと比べて三倍ほど遅くなるようです。

```bash
ghci> randomIO :: IO Double
0.1663032913035709
it :: Double
```

基本的に[System.Random]と同じように使用することができますが、いくつか異なる点があります。

- `randomR`系の関数は用意されていない
- `randoms`の返り値は`[a]`ではなく`IO [a]`になっている
- mersenne-randomでは`Integer`を指定すると`Int`の範囲でかえってくる


参考
----

- [System.Random]
- [HackageDB: mersenne-random-1.0.0.1][mersenne-random]
- [HackageDB: mwc-random-0.12.0.1](http://hackage.haskell.org/package/mwc-random)

[System.Random]: http://hackage.haskell.org/packages/archive/random/1.0.0.3/doc/html/System-Random.html
[mersenne-random]: http://hackage.haskell.org/package/mersenne-random