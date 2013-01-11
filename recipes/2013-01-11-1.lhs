---
title: hackageに登録されている関数検索する
description: hayooというサービスを使って関数を検索します。
tags: tool
---

2013-01-11.lhs(TODO:別記事へのリンク)では標準ライブラリを検索するhoogleを紹介しました。
[Hayoo! - Haskell API Search](http://holumbus.fh-wedel.de/hayoo/hayoo.html)はhackageに登録してある関数を全て探すことができます。
ただし、hackageでドキュメントが生成されているライブラリに限ります。
また、hackageのようなCLIは用意していないようです。


query
-----

hayooでは以下のqueryが有効です。また、空白区切りでAND検索になります。

query             説明
-----             ----
String            関数名・モジュール名・パッケージ概要からStringを検索
name:String       関数名を検索
package:String    パッケージ名を検索
module:String     モジュール名を検索(前方一致)
hierarchy:String  モジュール名を検索(部分一致)
`()`              queryをグループ化
AND, OR, NOT      論理演算
`String -> String` 型を検索

以下はqueryの例です。

- [map](http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=map&start=0)
- [name:`map`](http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=name%3Amap&start=0)
- [`map` OR `fold`](http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=map%20OR%20fold&start=0)
- [`map` package:`containers`](http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=map%20package%3Acontainers&start=0)
- [`map` hierarchy:`Lazy`](http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=map%20hierarchy%3ALazy&start=0)
- [(`map` OR `fold`) module:`Data.Map`](http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=(map%20OR%20fold)%20module%3AData.Map&start=0)
- [name:`attr` module:`Text.XML`](http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=name%3Aattr%20module%3AText.XML&start=0)
- [`String -> [String]`](http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=String%20-%3E%20%5BString%5D)


API
----

hayooにはJSON-baseのAPIも提供されています。
- [Hayoo! - Haskell API Search](http://holumbus.fh-wedel.de/hayoo/api.html)

APIは1つだけ、queryを受け取ってその結果を返すものです。

`http://holumbus.fh-wedel.de/hayoo/hayoo.json?query=YOUR_QUERY`

上記queryを投げると、以下のような結果が帰ってきます。

```json
        {
  "message":"Found 12 results and 17 completions.",
  "hits":12,
  "functions":[ {
    "name":"map",
    "uri":"http://hackage.haskell.org/...",
    "module":"Data.Map",
    "signature":"(a->b)->[a]->[b]",
    "package":"containers"
  }, ... ],
  "completions":[ {
    "word":"MapM",
    "count":11
  }, ... ],
  "modules":[ {
    "name":"Data",
    "count":19
  }  }, ... ],
  "packages":[ {
    "name":"containers",
    "count":13
  }, ... ]
}
```

余談
----

ちなみにHayooはSnapというHaskell製のwebフレームワークで開発されています。

参考
----

- [Hayoo! - Haskell API Search](http://holumbus.fh-wedel.de/hayoo/hayoo.html)
