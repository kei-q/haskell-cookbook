---
title: Haskellで振る舞い駆動開発(BDD)
description: hspecを使ってBDD
tags: test, hspec
date: 2013-01-31
---

HaskellでBDDを行うには[Hspec]というpackageを使います。
[Hspec]はRubyのBDDライブラリである[RSpec]を参考に作られたもののようです。
Haskellでテストを書くには[HUnit]というライブラリもありますが、こちらはTDDを行うためのライブラリです。
[HUnit]と比べて[Hspec]はテストを始めるのに覚えることが少なくて済み、導入するのが簡単です。

[Hspec]を使用するにはpackageのinstallが必要です。

```bash
$ cabal update
$ cabal install hspec
```

[Hspec]でテストを書くには、`Test.Hspec`というpackageを使います。テスト対象のmoduleをimportします。
Specは以下のように記述します。([Hspec]のサイトよりコード拝借)

> import Test.Hspec
>
> main :: IO ()
> main = hspec $ do
>   describe "Prelude.head" $ do
>     it "returns the first element of a list" $ do
>       head [23 ..] `shouldBe` (23 :: Int)

テストを書くために最低限必要な関数は以下の４つです。

関数         型                                         概要
--------     ---------------------------------------    --------------------
hspec        Spec -> IO ()                              記述したspecを実行し、結果を標準出力に表示
describe     String -> Spec -> Spec                     specをまとめて大きなspecに
it           Example v => String -> v -> Spec           specを記述
shouldBe     (Show a, Eq a) => a -> a -> Expectation    条件が満たされているか

これらを覚えておけばテストを書くことができますが、よりよいテストを書くためにも一度
[Hspec]や[Hspec - Hackage]に目を通すのが良いでしょう。
それほどドキュメントの量は多くないので、時間はかからないと思います。

参考
----

- [Hspec: Behavior-Driven Development for Haskell][Hspec]
- [RSpec.info: home][RSpec]

[Hspec - Hackage]: http://hackage.haskell.org/package/hspec
[Hspec]: http://hspec.github.com/
[RSpec]: http://rspec.info/
[QuickCheck]: http://hackage.haskell.org/package/QuickCheck
[HUnit]: http://hackage.haskell.org/package/HUnit-1.2.5.1