---
title: 数値を文字列に変換する
description: showを使って数値を文字列に変換します。
tags: prelude
date: 2013-01-21
---

数値を文字列に変換したいときは`show :: a -> String`を使います。

```bash
Prelude> show 1
"1"
it :: String
Prelude> show 1.2
"1.2"
it :: String
```

`show`は 5.lhs で紹介した`read`と対になっています。
`show`したものは`read`で読むことができ、`read`で読んだものは`show`で文字列にすることができます。

```bash
Prelude> show 1
"1"
it :: String
Prelude> read it :: Int
1
it :: Int
```

数値にかぎらず、[Showクラス](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#t:Show)のinstanceになっているものは文字列に変換することができます。
また、GHCi上で値が表示されるのはこの`show`が使われているためです。
そのため、Showのinstanceではないデータを表示しようとするとエラーが表示されます。
以下は関数を表示しようとしている例です。GHCiは関数をどのように表示したらよいかわからないので、`No instance for (Show (a0 -> a0))`というエラーメッセージが表示されています。

```bash
Prelude> \n -> n + 1

<interactive>:15:1:
    No instance for (Show (a0 -> a0))
      arising from a use of `print'
    Possible fix: add an instance declaration for (Show (a0 -> a0))
    In a stmt of an interactive GHCi command: print it
```


参考
----

- [show - Hoogle](http://www.haskell.org/hoogle/?hoogle=show)
- [Prelude - show](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:show)
