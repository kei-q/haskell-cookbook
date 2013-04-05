---
title: リストが（すべての|いずれかの）条件に一致するか調べる
description: any, all, and, orの使い方
tags: list
date: 2013-04-05
---

リストの要素が全て条件を満たすか確認したいときは`all`、いずれかの要素が条件を満たすか確認したいときは`any`を使います。それぞれ一つ目の引数に条件を、２つ目にリストを指定します。

- `Data.List.all`{.hoogle}
- `Data.List.any`{.hoogle}

```bash
ghci> all even [1..9]
False
ghci> all even [2,4..10]
True

ghci> any even [1..9]
True
ghci> any even [2,4..10]
True
```

引数が`[Bool]`であるときは、`and`と`or`が使えます。

- `Data.List.and`{.hoogle}
- `Data.List.or`{.hoogle}

```bash
ghci> and [True,True,True]
True
ghci> and [True,True,False]
False

ghci> or [True,True,True]
True
ghci> or [True,True,False]
True
```
