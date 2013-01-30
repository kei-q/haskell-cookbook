---
title: ghciで余分にimportしてしまったmoduleを省く
description: :moduleをつかって参照するmoduleをコントロールします
tags: ghci
date: 2013-01-30
---

ghciを起動してあるmoduleを試そうとした時に、importしたmoduleを取り消したい時があります。
例えば、以下の例では`Data.ByteString`をimportしたものの、`qualified`をつけ忘れて
名前が衝突してしまい、一旦`Data.ByteString`のimportをやめたい状況になっています。

```bash
[Prelude]
> import Data.ByteString
[Prelude Data.ByteString]
> :t tail

<interactive>:1:1:
    Ambiguous occurrence `tail'
    It could refer to either `Data.ByteString.tail',
                             imported from `Data.ByteString'
                          or `Prelude.tail',
                             imported from `Prelude' (and originally defined in `GHC.List')
```

一旦ghciを終了して再度importするのも良いですが、importしたmoduleが増えていると大変面倒です。
そんなときは`:module(:m) -<module name>`でスコープから特定のmoduleを省くことができます。
以下は間違ってimportしたmoduleを一旦取り消して、他のmoduleをimportしているところです。

```bash
[Prelude Data.ByteString]
> :m -Data.ByteString
[Prelude]
>
> import qualified Data.ByteString.Lazy as L
[Prelude L]
>
```

参考
----

- [2.7. GHCiのコマンド群](http://www.kotha.net/ghcguide_ja/latest/ghci-commands.html)