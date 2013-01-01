---
title: ghciで型を確認する
description: none
tags: basics, ghci
---

ghciで型を確認するには、`:t`を使います。

```bash
Prelude> :t 1
1 :: Num a => a
Prelude> :t "test"
"test" :: [Char]
```

`:set +t`と入力すると、常に評価された値の型が表示されます。
`:unset +t`と入力すると、型は表示されなくなります。

```bash
Prelude> :set +t
Prelude> 1
1
it :: Integer
Prelude> "test"
"test"
it :: [Char]
```

もしこの設定をdefaultにしたい場合はhome directoryに.ghciというファイルを作成し、以下の内容を追記します。
これでじかいＮお ghci起動時から設定が有効になった状態で起動します。

```
:set +t
```

参考
----

- [2.8. :setと:setiコマンド](http://www.kotha.net/ghcguide_ja/latest/ghci-set.html)
- ghci上で`:?`と入力