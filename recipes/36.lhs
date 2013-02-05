---
title: '$'とは？
description: Haskellのコードを読んでいると出てくる'$'という演算子について
tags: basics
date: 2013-02-05
---

Haskellのコードを読んでいると、`$`という記号をよく目にします。
[Preludeのコード](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:-36-)をみると、以下のように定義されています。

```haskell
($)                     :: (a -> b) -> a -> b
f $ x                   =  f x
infixr 0  $
```

この定義だけを見ると何もしていないように見えますが、これを定義していると以下のようにかっこが省略できるようになります。

```bash
-- 括弧によるコード
ghci> let test2 xs = print (filter (not . snd) (zip [0..] xs))
-- `$`によるコード
ghci> let test1 xs = print $ filter (not . snd) $ zip [0..] xs
```

`do`記法を用いているときはより顕著にコードがスッキリすると思います。
`$`を使った例として、[31.lhs]で紹介したHspecのコードを取り上げます。

> import Test.Hspec
> spec1 :: IO ()
> spec1 = hspec $ do
>   describe "Prelude.head" $ do
>     it "returns the first element of a list" $ do
>       head [23 ..] `shouldBe` (23 :: Int)

このコードを`$`を使わずに書くと以下のようになります。

> spec2 :: IO ()
> spec2 = hspec (do
>   describe "Prelude.head" (do
>     it "returns the first element of a list" (do
>       head [23 ..] `shouldBe` (23 :: Int))))

`do`を使ったコードは複数行に及ぶので、`()`の位置が離れてしまいますし、
`()`の対応を考えたりするのも大変です。
Haskellではindentによるblockの表現があるので、`$`を導入するとコードがスッキリしたようにみえると思います。

参考
----

- [Prelude](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:-36-)