---
title: 時刻を比較したい
description: Ordクラスのメソッドを使用して比較します
tags: standard_library, time
date: 2013-02-10
---

[UTCTime]は[Eq][Prelude - Eq]や[Ord][Prelude - Ord]のメソッドを使用できます。

```bash
-- 今回のサンプルのために適当に時刻のデータを用意
ghci> time <- getCurrentTime
time :: UTCTime
ghci> let times@[t1,t2,t3] = scanl (flip addUTCTime) time (replicate 2 (60*60))
t1 :: UTCTime
t2 :: UTCTime
t3 :: UTCTime
times :: [UTCTime]
```

実際に[Ord][Prelude - Ord]を使ってみると、以下のように結果を得ることができます。

```bash
ghci> t1 < t2
True
it :: Bool
ghci> t1 < t2
True
it :: Bool
ghci> t1 > t2
False
it :: Bool
ghci> t1 `max` t2
2013-02-10 02:41:48.894705 UTC
it :: UTCTime
ghci> t1 `min` t2
2013-02-10 01:41:48.894705 UTC
it :: UTCTime
```

[Ord][Prelude - Ord]クラスのインスタンスが定義されていることにより、[maximum]や[minimum]、[sort]といった関数も使用できます。

```bash
ghci> maximum times
2013-02-10 04:41:48.894705 UTC
it :: UTCTime
ghci> minimum times
2013-02-10 01:41:48.894705 UTC
it :: UTCTime
ghci> Data.List.sort times
[2013-02-10 01:41:48.894705 UTC,2013-02-10 02:41:48.894705 UTC,2013-02-10 03:41:48.894705 UTC]
it :: [UTCTime]
```

参考
----

- [time]
- [Data.Time.Clock]

[Data.Time.Clock]: http://hackage.haskell.org/packages/archive/time/1.4.0.2/doc/html/Data-Time-Clock.html
[time]: http://hackage.haskell.org/package/time
[UTCTime]: http://hackage.haskell.org/packages/archive/time/latest/doc/html/Data-Time-Clock.html#t:UTCTime

[Prelude - Eq]: http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#t:Eq
[Prelude - Ord]: http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#t:Ord
[maximum]: http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:maximum
[minimum]: http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:minimum
[sort]: http://hackage.haskell.org/packages/archive/base/latest/doc/html/Data-List.html#v:sort