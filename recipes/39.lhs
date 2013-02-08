---
title: 日付を文字列に変換したい
description: Data.Time.FormatのformatTimeを使用します
tags: standard_library, time
date: 2013-02-08
---

日付を文字列に変換するには、[Data.Time.Format]の[`formatTime :: FormatTime t => TimeLocale -> String -> t -> String`][formatTime]を使用します。

この関数を使用するには以下のimportが必要です。

> import Data.Time (getCurrentTime)
> import Data.Time.Format (formatTime)
> import System.Locale (defaultTimeLocale)

以下は日付を"YY-MM-DD"形式の文字列に変換する例です。

```bash
ghci> time <- getCurrentTime
ghci> formatTime defaultTimeLocale "%Y-%m-%d" time
"2013-02-08"
it :: String
```

基本的に[38.lhs]で紹介した`formatTime`と使い方は共通していて、
時刻のformatを指定する二番目の引数には同じ物が指定出来ます。
そのため、同じformatの文字列を指定すれば時間に戻すことができます。

```bash
ghci> time <- getCurrentTime
ghci> formatTime defaultTimeLocale "%Y-%m-%d" time
"2013-02-08"
it :: String
ghci> parseTime defaultTimeLocale "%Y-%m-%d" it :: Maybe UTCTime
Just 2013-02-08 00:00:00 UTC
it :: Maybe UTCTime
```

参考
----

- [time]
- [Data.Time.Format]
- `man date`

[formatTime]: http://www.haskell.org/ghc/docs/6.12.2/html/libraries/time-1.1.4/Data-Time-Format.html#v%3AformatTime
[Data.Time.Format]: http://hackage.haskell.org/packages/archive/time/1.4.0.2/doc/html/Data-Time-Format.html
[time]: http://hackage.haskell.org/package/time
[defaultTimeLocale]: http://www.haskell.org/ghc/docs/6.12.2/html/libraries/old-locale-1.0.0.2/System-Locale.html#v%3AdefaultTimeLocale
