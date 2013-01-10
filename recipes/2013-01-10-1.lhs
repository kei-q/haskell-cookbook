---
title: オフラインで関数を検索する
description: hoogleをinstallしてオフラインでも関数を検索できるようにします
tags: tool
---

以下の手順でhoogleをinstallし、データを初期化します。

```bash
$ cabal update
$ cabal install hoogle
$ hoogle data
```

installが完了すると`hoogle`というコマンドができているので、
これを使用します。

```bash
$ hoogle "String -> String"
Data.Data tyconModule :: String -> String
Data.Data tyconUQname :: String -> String
Test.QuickCheck.Text bold :: String -> String
Network.URI normalizeCase :: String -> String
Network.URI normalizeEscape :: String -> String
...
```

検索のqueryはweb版と同じですが、幾つかコマンドラインオプションが用意されています。

- `--version` : version表示
- `--help` : help
- `--include=dir` : 検索対象を指定します。defaultでは'.'と`hoogle data`した中身
- `--color` : 出力結果に色を付ける
- `--count=int` : 表示件数を`int`件にする
- `--start=int` : `int`件目から表示する
- `--info` : 詳しい情報を表示する

今回installしたhoogleにはサーバ機能もあり、以下のコマンドで [Hoogle](http://www.haskell.org/hoogle/)と同じ物がオフラインでも参照できるようになります。

```
$ hoogle server --port 8080
```

TODO:
- cabal, cab

参考
----

- [Hoogle](http://www.haskell.org/hoogle/)
- [Hoogle - HaskellWiki](http://www.haskell.org/haskellwiki/Hoogle)
- [unite-haddock に hoogle の結果を使う source を追加した - eagletmt's blog](http://eagletmt.hateblo.jp/entry/2012/03/17/194950)