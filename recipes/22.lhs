---
title: 一部だけ引数を指定して、残りは規定値を使うような関数を定義したい
description: 設定用のデータ型を定義してオプションを設定可能にします
tags: untagged
date: 2013-01-22
---

> module R20130122 where

簡易HTTPサーバのライブラリを作成したとして、以下のようなアクションを書いたとします。

> type Host = String
> type Port = Int
> server' :: Host -> Port -> IO ()
> server' host port = undefined

ここで、一部の引数を省略可能にして、省略したら規定の値を使いたい、という状況に
なったとします。例えば、他にもserverを起動しているのでportだけ変更したい、とか
無指定で起動したら標準的な環境で起動したい、といった状況です。
以下のようにそれぞれの引数に対して規定値を事前に指定した別アクションを定義
することもできますが、冗長ですし、引数の数が増えたらたいへんなことになります。

> serverWithHost :: Port -> IO ()
> serverWithHost port = server' "localhost" port
> serverWithPort :: Host -> IO ()
> serverWithPort host = server' host 8080
> defaultServer :: IO ()
> defaultServer = server' "localhost" 8080

このような場合、オプションが指定可能なデータ型とレコード構文を使用して問題を解決します。
以下のように、設定する項目を一つのデータ型（ここでは`Config`）にまとめ、
それを受け取るようにします。
利便性のため、全て規定値を使う時のために`server`というアクションも定義しています。
`Config`を受け取る`serverWith`が実態となります。

> -- | defaultの設定でserverを起動
> server :: IO ()
> server = serverWith defaultConfig
> -- | 一部設定を変更してサーバを起動
> serverWith :: Config -> IO ()
> serverWith config = undefined -- configを使用してserver起動

次に、オプションのためのデータ構造を普通に定義します。
このとき、合わせてdefaultとなる値を用意しておきます。

> data Config = Config { host :: Host, port :: Port } deriving (Show)
> defaultConfig :: Config
> defaultConfig = Config { host = "localhost", port = 3000 }

ユーザが一部の設定を変更して使用するときは、以下の様なコードを記述します。
これで、指定したport以外の値はdefaultConfigに記述した値が使用できます。

> -- portを8080番に変更して起動
> myServer = serverWith defaultConfig{ port = 8080 }

ここでは、レコードの後ろに`{label = value}`という形式で記述しているコードがあります。
これは、レコードの後ろにフィールドラベルと値を書くと、そのレコードの中身を指定した値で
置き換えたものが返ってきます。

> -- | portを置き換え
> -- >>> defaultConfig { port = 8080 }
> -- Config {host = "localhost", port = 8080}

このテクニックは[xmonad]や[hakyll]などで見ることができます。

[xmonad]: http://xmonad.org/
[hakyll]: http://jaspervdj.be/hakyll/

参考
----

- hakyll
    - [Hakyll.Main](http://jaspervdj.be/hakyll/reference/Hakyll-Main.html)
    - [Hakyll.Core.Configuration](http://jaspervdj.be/hakyll/reference/Hakyll-Core-Configuration.html)
- XMonad
    - [XMonad.Main](http://hackage.haskell.org/packages/archive/xmonad/0.11/doc/html/XMonad-Main.html)
    - [XMonad.Config](http://hackage.haskell.org/packages/archive/xmonad/0.11/doc/html/XMonad-Config.html)
- TODO: レコードの値を置き換える構文の説明が載っているページのリンクを載せる
