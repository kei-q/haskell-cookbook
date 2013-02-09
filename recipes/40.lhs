---
title: 一日(前|後)の日付を取得したい
description: Data.Time.ClockのNoinalDiffTimeを使用します
tags: standard_library, time
date: 2013-02-09
---

今回は以下のmoduleを使用します。

> import Data.Time (getCurrentTime)
> import Data.Time.Clock (addUTCTime)

[Data.Time.Clock]の`addUTCTime :: NominalDiffTime -> UTCTime -> UTCTime`を使用します。
以下は、現在時刻の1日(前|後)を取得する例です。

```bash
ghci> addUTCTime (24*60*60) time
2013-02-10 02:23:20.775629 UTC
it :: UTCTime
ghci> addUTCTime (-24*60*60) time
2013-02-08 02:23:20.775629 UTC
it :: UTCTime
```

２つ目の引数に、差分を秒単位で指定します。`addUTCTime`に対応した`subUTCTime`のような関数は用意されていないので、N秒前の時間が欲しい時は`addUTCTime`に負の数を指定します。

最初の引数に数値を指定していますが、`NominalDiffTime`はNumのinstanceが定義されているので、数値を書くと処理系が型を推論してくれます。

参考
----

- [time]
- [Data.Time.Clock]

[Data.Time.Clock]: http://hackage.haskell.org/packages/archive/time/1.4.0.2/doc/html/Data-Time-Clock.html
[time]: http://hackage.haskell.org/package/time
