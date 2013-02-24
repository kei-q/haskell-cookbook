---
title: データの文字列表現を読みやすい形で出力する
description: pretty-showパッケージを使ってデータを読みやすくします
tags: untagged
date: 2013-01-24
---

Haskellでは`driving Show`を使うと、定義したデータの文字列表現を自動で提供してくれる
機能があります。しかし人間の読みやすい形に出力してくれるわけではないため、
fieldが増えたりデータ型が入れ子になって深いデータになったり、`show`の結果が
長い文字列になる時は何が表示されているのか読めないケースがあります。

```bash
Prelude> data T = T { hoge :: String, fuga :: String } deriving (Show)
data T = T {hoge :: String, fuga :: String}
Prelude> T { hoge = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fuga = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb" }
T {hoge = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fuga = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}
Prelude>
```

[pretty-show]パッケージの[ppShow]関数を使用すると、適宜改行やインデントを加えた文字列を返してくれる
関数が使用できるようになります。
使用にあたり、まずは必要なパッケージをインストールします。

```bash
$ cabal install pretty-show
```

[ppShow]は既にShowクラスのインスタンスとして定義されているデータ型に使用することができます。
先程の例をppShowで出力すると、`hoge`と`fuga`というフィールドラベルが前の方に来ていて、
`fuga`の存在がわかりやすくなっています。

```bash
[Prelude]
> import Text.Show.Pretty
[Prelude Text.Show.Pretty]
> putStrLn $ ppShow $ T { hoge = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fuga = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb" }
T { hoge = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  , fuga = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
  }
```

もっと大きいデータだと差が顕著になります。
例えば、以下のように単にprintしただけでは何がどうなっているのかわからないデータが有るとします。

```bash
[Prelude Text.Show.Pretty]
> import Hakyll
[Prelude Text.Show.Pretty Hakyll]
> defaultHakyllReaderOptions
ReaderOptions {readerExtensions = fromList [Ext_footnotes,Ext_inline_notes,Ext_pandoc_title_block,Ext_table_captions,Ext_implicit_figures,Ext_simple_tables,Ext_multiline_tables,Ext_grid_tables,Ext_pipe_tables,Ext_citations,Ext_raw_tex,Ext_raw_html,Ext_tex_math_dollars,Ext_latex_macros,Ext_fenced_code_blocks,Ext_fenced_code_attributes,Ext_backtick_code_blocks,Ext_inline_code_attributes,Ext_markdown_in_html_blocks,Ext_escaped_line_breaks,Ext_fancy_lists,Ext_startnum,Ext_definition_lists,Ext_example_lists,Ext_all_symbols_escapable,Ext_intraword_underscores,Ext_blank_before_blockquote,Ext_blank_before_header,Ext_strikeout,Ext_superscript,Ext_subscript,Ext_auto_identifiers,Ext_header_attributes,Ext_implicit_header_references,Ext_line_blocks], readerSmart = True, readerStrict = False, readerStandalone = False, readerParseRaw = False, readerColumns = 80, readerTabStop = 4, readerOldDashes = False, readerReferences = [], readerCitationStyle = Nothing, readerApplyMacros = True, readerIndentedCodeClasses = []}
```

以下が[ppShow]を使った表示になります。どのようなフィールドラベルがあるか
だいぶわかりやすくなっています。

```bash
[Prelude Text.Show.Pretty Hakyll]
> putStrLn $ ppShow defaultHakyllReaderOptions
ReaderOptions
  { readerExtensions = fromList
                         [ Ext_footnotes
                         , Ext_inline_notes
                         , Ext_pandoc_title_block
                         , Ext_table_captions
                         , Ext_implicit_figures
                         , Ext_simple_tables
                         , Ext_multiline_tables
                         , Ext_grid_tables
                         , Ext_pipe_tables
                         , Ext_citations
                         , Ext_raw_tex
                         , Ext_raw_html
                         , Ext_tex_math_dollars
                         , Ext_latex_macros
                         , Ext_fenced_code_blocks
                         , Ext_fenced_code_attributes
                         , Ext_backtick_code_blocks
                         , Ext_inline_code_attributes
                         , Ext_markdown_in_html_blocks
                         , Ext_escaped_line_breaks
                         , Ext_fancy_lists
                         , Ext_startnum
                         , Ext_definition_lists
                         , Ext_example_lists
                         , Ext_all_symbols_escapable
                         , Ext_intraword_underscores
                         , Ext_blank_before_blockquote
                         , Ext_blank_before_header
                         , Ext_strikeout
                         , Ext_superscript
                         , Ext_subscript
                         , Ext_auto_identifiers
                         , Ext_header_attributes
                         , Ext_implicit_header_references
                         , Ext_line_blocks
                         ]
  , readerSmart = True
  , readerStrict = False
  , readerStandalone = False
  , readerParseRaw = False
  , readerColumns = 80
  , readerTabStop = 4
  , readerOldDashes = False
  , readerReferences = []
  , readerCitationStyle = Nothing
  , readerApplyMacros = True
  , readerIndentedCodeClasses = []
  }
```

ghciを起動するたびにmoduleをimportするのが面倒な場合は、`.ghci`に事前に定義しておくと便利です。

```haskell
-- 要pretty-show
:m Text.Show.Pretty
let pp x = putStrLn $ ppShow x
```

この設定により、起動してすぐに`pp`というアクションを使うことができるようになります。

```bash
$ ghci
GHCi, version 7.4.2: http://www.haskell.org/ghc/  :? for help
# Loading package省略
Loading package pretty-show-1.5 ... linking ... done.
pp :: Show a => a -> IO ()
[Prelude Text.Show.Pretty]
> pp ["hoge","fuga"]
[ "hoge"
, "fuga"
]
```

[pretty-show]: http://hackage.haskell.org/package/pretty-show
[ppShow]: http://hackage.haskell.org/packages/archive/pretty-show/1.5/doc/html/Text-Show-Pretty.html#ppShow

参考
----

- [Simple Haskell Data Pretty-printing | Shinobu's Secrets](http://zuttobenkyou.wordpress.com/2011/02/27/simple-haskell-data-pretty-printing/)
