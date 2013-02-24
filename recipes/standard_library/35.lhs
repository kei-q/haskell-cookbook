---
title: ビット演算するには
description: Data.Bitsを使ってHaskellでビット演算を行います
tags: standard_library, data
date: 2013-02-04
---

Haskellでビット演算をするには[Data.Bits]を使います。

> import Data.Bits

このレシピは実行可能です。`hspec`を入れた環境で`main`を実行すると、
以下のテストが実行できます。

> import Test.Hspec
> main :: IO ()
> main = hspec $ do
>   bit1
>   bit2
>   bit3

基本的な演算
----

ANDやORといった基本的な演算は以下のとおりです。

> m, n :: Int
> m = 3
> n = 2
> bit1 :: Spec
> bit1 = describe "基本的なbit演算" $ do
>   it "AND"     $ (m .&. n)    `shouldBe` 2
>   it "OR"      $ (m .|. n)    `shouldBe` 3
>   it "XOR"     $ (m `xor` n)  `shouldBe` 1
>   it "bit反転" $ complement m `shouldBe` -4
>   it "左にshift" $ m `shiftL` 1 `shouldBe` 6
>   it "右にshift" $ m `shiftR` 1 `shouldBe` 1
>   it "右にshift" $ m `rotateL` 1 `shouldBe` 6
>   it "右にshift" $ m `rotateR` 1 `shouldBe` -9223372036854775807

個々のビット操作
----

ビットを一つ一つ操作するための操作は以下のものが用意されています。

> target :: Int
> target = 4
> bit2 :: Spec
> bit2 = describe "個々のbitに対する演算" $ do
>   it "n番目のbitだけが立っている数をつくる" $ do
>     bit 1 `shouldBe` (2 :: Int)
>     bit 2 `shouldBe` (4 :: Int)
>   it "n番目のビットを立てる" $ do
>     target `setBit` 1 `shouldBe` 6
>     target `setBit` 2 `shouldBe` 4
>   it "n番目のビットをclear" $ do
>     target `clearBit` 1 `shouldBe` 4
>     target `clearBit` 2 `shouldBe` 0
>   it "n番目のビットをxor" $ do
>     target `complementBit` 1 `shouldBe` 6
>     target `complementBit` 2 `shouldBe` 0
>   it "n番目のビットが立っているか確認する" $ do
>     target `testBit` 1 `shouldBe` False
>     target `testBit` 2 `shouldBe` True

その他の演算
----

> target3 :: Int
> target3 = 4
> bit3 :: Spec
> bit3 = describe "その他のbit演算" $ do
>   it "その型が表現できるbitの幅" $ do
>     bitSize target3 `shouldBe` 64 -- おそらく環境依存
>   it "負の数を表現できるか" $ do
>     isSigned target3 `shouldBe` True

参考
----

- [Data.Bits]

[Data.Bits]: http://lambda.haskell.org/platform/doc/current/ghc-doc/libraries/haskell2010-1.1.0.1/Data-Bits.html