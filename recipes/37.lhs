---
title: 日付を扱いたい
description: timeパッケージの各種moduleを使用して日付を処理します
tags: standard_library, time
date: 2013-02-06
---

Haskellで日付を扱うには[Data.Time]を始めとする各種moduleを使用します。
timeパッケージは標準ライブラリに含まれているため、すぐに使用できます。

基本となるmoduleは以下の４つです。また、[Data.Time]をimportすると
以下の４つに含まれるものが使用できるようになります。

module名                概要
------------------      ------------------
[Data.Time.Calendar]    日付を扱う。時間はClockの方を使用
[Data.Time.Clock]       時間も含めて扱うならこちら
[Data.Time.Format]      CalendarやClockにあるデータ型を文字列に変換したり、文字列からデータ型に変換
[Data.Time.LocalTime]   TimeZone依存の時間を扱う

現在の時刻を取得したいときは`getCurrentTime :: IO UTCTime`を使用します。

```bash
ghci> import Data.Time
ghci> getCurrentTime
2013-02-06 02:49:44.091142 UTC
it :: UTCTime
```

参考
----

- [time]

[Data.Time]: http://hackage.haskell.org/packages/archive/time/1.4.0.2/doc/html/Data-Time.html
[Data.Time.Calendar]: http://hackage.haskell.org/packages/archive/time/1.4.0.2/doc/html/Data-Time-Calendar.html
[Data.Time.Clock]: http://hackage.haskell.org/packages/archive/time/1.4.0.2/doc/html/Data-Time-Clock.html
[Data.Time.Format]: http://hackage.haskell.org/packages/archive/time/1.4.0.2/doc/html/Data-Time-Format.html
[Data.Time.LocalTime]: http://hackage.haskell.org/packages/archive/time/1.4.0.2/doc/html/Data-Time-LocalTime.html
[time]: http://hackage.haskell.org/package/time