---
title: 日付/時刻を簡単に扱う
description: time-lensパッケージの紹介
tags: time
date: 2013-02-11
---

標準ライブラリで提供されている[Data.Time]は日付/時刻を表現できるものの、
時間だけを取得したり、少し前の時刻に変換したりするのが煩雑でした。
例えば、一日後の日付を取得するには、`UTCTime`を分解して日付に`addDays`を適用したあと再度梱包するか、もしくは`addUTCTime`を使って一日分の秒数を指定する必要があります。
目的は達成できますが、大変読みづらいです。

```bash
ghci> t <- getCurrentTime

-- addDays
ghci> UTCTime (addDays 1 (utctDay t)) (utctDayTime t)
2013-02-12 02:21:25.262174 UTC
it :: UTCTime

-- addUTCTime
ghci> addUTCTime (24*60*60) t
2013-02-12 02:21:25.262174 UTC
it :: UTCTime
```

今回は[time-lens]パッケージによってこの辺りの問題を解消します。

今回登場するmoduleは以下の通りです。

> import Data.Time
> import Data.Time.Lens

[time-lens]を使うと、先にでてきた一日後の日付を取得するコードは以下のようになります。
前述の例より日付を変化させているのが明確になっているかと思います。

```bash
ghci> modL day (+1) t
2013-02-12 02:21:25.262174 UTC
it :: UTCTime
```

[time-lens]が便利なところは、様々な日付/時刻のデータに対して共通のインタフェースで
操作を行えるところにあります。先ほどの例では`UTCTime`という型を使用しましたが、
日付だけ表現する`Day`という型もあります。こちらも同じ使い方で一日後の日付を取得することができます。

```bash
ghci> let d = fromGregorian 2013 01 01
d :: Day
ghci> modL day (+1) d
2013-01-02
it :: Day
```

また、Data.Timeの関数では日付を変更するのに`addDays`という関数しか用意されておらず、
N日前の日付を取得したり、N月後、N年後などを表現するのにわかりにくいコードになりがちでした。一方[time-lens]では操作の内容(modLなど)と操作の対象(dayなど)を組み合わせて使用することができるため、書きやすく、読みやすいコードを構成することができます。

時刻に対してどのような操作をするかは以下の関数が用意されているので、これを使用します。

- `getL`: 値を取得
- `modL`: 値を更新
- `setL`: 値を設定

上記の関数と合わせて、どのデータを対象とするかは以下を使用して設定します。

- 日付
    - `hours` :: Int
    - `minutes` :: Int
    - `seconds` :: Pico
    - `time` :: TimeOfDay
- 時刻
    - `year` :: Integer
    - `month` :: Int
    - `day` :: Int
    - `gregorian` (Integer, Int, Int)
    - `date` :: Day

上記を組み合わせて様々な操作を行うことができます。

```bash
ghci> let d = fromGregorian 2013 01 01
d :: Day

ghci> getL day d
1
it :: Int

ghci> modL day (subtract 1) d
2012-12-31
it :: Day

ghci> setL day 10 d
2013-01-10
it :: Day
```

参考
----

- [time-lens]

[time-lens]: http://hackage.haskell.org/package/time-lens