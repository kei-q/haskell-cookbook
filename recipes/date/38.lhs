---
title: 文字列を日付に変換したい
description: Data.Time.FormatのparseTimeを使用します
tags: standard_library, time
date: 2013-02-07
---

文字列を日付にに変換するには、[Data.Time.Format]の[`parseTime :: ParseTime t => TimeLocale -> String -> String -> Maybe t`][parseTime]を使用します。

この関数を使用するには以下のimportが必要です。

> import Data.Time.Format (parseTime)
> import System.Locale (defaultTimeLocale)

以下は"YY-MM-DD"の形式の文字列を日付に変換する例です。

```bash
ghci> parseTime defaultTimeLocale "%Y-%m-%d" "2013-01-01" :: Maybe UTCTime
Just 2013-01-01 00:00:00 UTC
it :: Maybe UTCTime
```

ここで、最初に[defaultTimeLocale]という値を指定しています。
これは曜日の名前(月火やMon,Tueなど)や、月の名前など、地域によって変わるものを指定することができます。
最初は[defaultTimeLocale]を指定し、曜日に和名を使いたいなどあれば[TimeLocale]を見ながら
localeの情報を調整します。

timeLocaleに従ったformatに対応する場合は"%c"というformat文字列を使用すると便利です。

```bash
ghci> parseTime defaultTimeLocale "%c" "Tue Sep  5 23:37:35 UTC 2006" :: Maybe UTCTime
Just 2006-09-05 23:37:35 UTC
it :: Maybe UTCTime
```

どのようなformatが使用できるかは[Data.Time.Format]のhaddockに記載されています。
ちなみに、ここで使われるformatは`date`コマンドで使用できるものと同じものです。
試しに`date`コマンドで"YY-MM-DD"形式で現在の日付を表示すると以下のようになります。

```bash
$ date +"%Y-%m-%d"
2013-02-07
```

参考
----

- [time]
- [Data.Time.Format]
- `man date`

[parseTime]: http://www.haskell.org/ghc/docs/6.12.2/html/libraries/time-1.1.4/Data-Time-Format.html#v%3AparseTime
[Data.Time.Format]: http://hackage.haskell.org/packages/archive/time/1.4.0.2/doc/html/Data-Time-Format.html
[time]: http://hackage.haskell.org/package/time
[defaultTimeLocale]: http://www.haskell.org/ghc/docs/6.12.2/html/libraries/old-locale-1.0.0.2/System-Locale.html#v%3AdefaultTimeLocale
[TimeLocale]: http://www.haskell.org/ghc/docs/6.12.2/html/libraries/old-locale-1.0.0.2/System-Locale.html#t%3ATimeLocale