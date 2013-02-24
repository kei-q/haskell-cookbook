---
title: fieldの多いrecordで、中身を取り出すのが面倒なとき
description: 言語拡張のRecordWildCards
tags: GHC, record
date: 2013-02-21
---

今回の recipeでは以下の拡張を使用します。

> {-# LANGUAGE RecordWildCards #-}

次のような、人を表すデータ型があるとします。
このとき、データを読みやすい形式に変換する関数を用意したいとします。

> data Person = Person
>     { name :: String
>     , age :: Int
>     , birthday :: UTCTime
>     }

単純に関数を書くと以下のようになります。
毎回`person`に対してそれぞれのデータを取得するための関数適用が面倒ですね。

> showPerson :: Person -> String
> showPerson person = name person ++ "さんは" ++ show (birthday person) ++ "生まれで今年" ++ show (age person) ++ "歳です"

拡張機能の`RecordWildCards`を使用すると、fieldの名前がそのまま使えるようになります。
以下が書き換えた結果になります。

> showPerson' :: Person -> String
> showPerson' Person{..} = name ++ "さんは" ++ show birthday ++ "生まれで今年" ++ show age ++ "歳です"

参考
----
- [GHC - 7.3.19. レコードワイルドカード]

[GHC - 7.3.19. レコードワイルドカード]: http://www.kotha.net/ghcguide_ja/latest/syntax-extns.html#record-wildcards