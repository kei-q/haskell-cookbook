---
title: ByteString要求されてimportしたのにエラーが発生する
description: aesonなどを試そうとした時にはまることとその対処法
tags: string
date: 2013-02-25
---

HaskellでJSONを扱う[Data.Aeson]を使いたいとき、[ドキュメント][Data.Aeson]にある
コードを試してみたくて以下の様に書いたとします。

> {-# LANGUAGE OverloadedStrings #-}
> import Data.Aeson
>
> test = decode "{\"name\":\"Joe\",\"age\":12}" :: Maybe Value

残念ながら、このコードは以下のエラーを出力します。

```bash
ghci> test
/Users/keqh/projects/haskell-cookbook/recipes/string/56.lhs:11:17:
    No instance for (Data.String.IsString
                       Data.ByteString.Lazy.Internal.ByteString)
      arising from the literal `"{\"name\":\"Joe\",\"age\":12}"'
    Possible fix:
      add an instance declaration for
      (Data.String.IsString Data.ByteString.Lazy.Internal.ByteString)
...
```

これを解決するには、以下のimportが必要となります。

```haskell
import Data.ByteString.Lazy.Char8 ()
```

importを追加し、再度実行すると以下のように評価することができるようになります。

```bash
ghci> test
Just (Object fromList [("name",String "Joe"),("age",Number 12)])
it :: Maybe Value
```

`Data.ByteString.Lazy.Char8`が必要になるまでの流れは以下のとおり。

- `decode`という関数は引数に`ByteString`を要求する
- 文字列リテラルを`OverloadedStrings`という拡張でByteStringに認識してもらうようにしている
- `OverloadedStrings`は変換先の型が`IsString`という型クラスのinstanceであることを要求している
- `Data.ByteString.Lazy.Char8`をimportすることで、`decode`で使う`ByteString`の`IsString` instanceが読み込まれる

参考
----
[Data.Aeson]: http://hackage.haskell.org/packages/archive/aeson/0.6.1.0/doc/html/Data-Aeson.html