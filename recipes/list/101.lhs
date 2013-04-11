---
title: drop関数で数ではなく条件で指定したいとき
description: dropWhileの使い方
tags: list
date: 2013-04-11
---

>

`drop`では先頭n個の要素を除いたリスト取得しましたが、`dropWhile`を使うと`Int`ではなく条件を指定することができます。

- `Data.List.dropWhile`{.hoogle}

```bash
ghci> dropWhile (<=3) [1,2,5,3,4]
[5,3,4]

ghci> dropWhile (<=100) [1,2,5,3,4]
[]

ghci> dropWhile (<=0) [1,2,5,3,4]
[1,2,5,3,4]
```

