
候補
====

devtools
----

Haskell-platformとは
Haskell環境の構築 (windows編):windows上でGHCを動かす
Haskell環境の構築 (linux編)
Haskell環境の構築 (max OSX編)
VimでHaskellのコードを書く
EmacsでHaskellのコードを書く
Sublime TextでHaskellのコードを書く
EclipseFPでHaskellのコードを書く
leksahでHaskellのコードを書く
manateeでHaskellのコードを書く

hlint
ghc-mod
hdevtools
cabal
cabal-dev
cabalで特定のversionをinstallする:versionを指定してinstallする方法
cab
ghci
hasktags
utils/ghctags
cabalパッケージの作成
hackageが落ちたときの代替手段:.cabal/configの設定とbackup server
hsenv
virtualenv
ghciで外部に公開していない関数を使う:*Main
エラーを読み解く:コンパイル時エラーを恐れない
自動生成できるドキュメントを書く:haddockの書き方

開発方針
----

coding style
部分関数
例外処理
エラー処理

pearls
----

SYB
zipper
STM
elseが`return ()`のとき:Control.Monad.whenを使う

haskell2010
----

ガード式の使い方
case式の使い方
セクションと中置記法
`do`の中でかける構文:letなどの違いについて
ソースコードを分割する:moduleの使い方と階層ライブラリ
importせずに使える機能を知る:Preludeで使える関数など
外部モジュールを使用する:importについて
pattern matchとは:
pattern matchで使える記法
C言語で書かれたライブラリをHaskellで使えるようにする:FFI
ユーザ定義型を使う:dataの使い方
型推論
モナド変換子

num
----

三角関数:Floatingクラス
数値の相互変換:Int,Integer,Float,Double
FloatよりDoubleが速いわけ:コードで学ぶ最適化

string
----

複数行の文字列リテラルを記述する:interpolationを使う
文字のコードを取得:Data.Charのord,chr
Haskellで正規表現をつかう:Parsecを使いましょう
Haskellで正規表現をどうしても使いたい:Regex
printfで文字列をフォーマットしたい:Text.Printf
日本語を扱う:UTF-8とghciで化けるアレの対処

list
----

ユーザ定義型で`[a .. b]`のようなリテラルをかけるようにする:Enumのinstance定義
リストで隣同士の要素を見ながら処理をする:`zip list (tail list)`

IO
----

コマンドライン引数の処理:getopt
コマンドライン引数の処理:CmdArgs
コマンドライン引数の処理:optparse-applicative
ユーザ定義型をランダム:Randomのinstance宣言
高速な擬似乱数生成:mwc-random

data
----

Map
Set
Vector
Array

external library
----

jsonを扱う:aeson
xmlを扱う:Text.XML
RSSを読み込む:
外部コマンド実行する:baseに含まれるProcess
外部コマンド実行する:process-conduit
defaultな値を表現する:Data.Default
HaskellでGUIアプリ:Gtk
webアプリを作る:各種ライブラリの紹介
webアプリを作る:scotty
webアプリを作る:yesod
webアプリを作る:happstack
webアプリを作る:snap
markdownを扱う:pandoc

testing
----

doctest
criterion
quickcheck
hunit
Internalモジュール
    [unit-test-example/markdown/ja/tutorial.md at master · kazu-yamamoto/unit-test-example · GitHub](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/ja/tutorial.md)
travis-CIによるtest

ネタ
----

ハノイの塔
クイックソート
ナベアツ



未整理
====

- 開発環境
  - Haskellの処理系をinstallする
    - haskell-platformを導入する
  - sublimeでHaskell開発環境を整える
    - SublimeHaskellの導入と使い方
  - eclipseFPを使ってHaskellでプログラミング
    - eclipseFPの構築と機能
  - emacsでHaskell開発環境を整える
  - vimでHaskell開発環境を整える
  - 定義した関数を試してみる
    - ghci
  - ghciでよく使う設定を予め有効にする方法
    - .ghciを定義する
  - hackageに登録されているpackageをインストールする
    - cabal installの使い方とcabの紹介
  - installしたpackageを削除する
    - cab uninstallを使ってpackageを削除する
  - Haskellのcoding styleについて知りたい
    - haskell coding styleの紹介(github, snapなど)

- 開発
  - ソースコードからドキュメントを生成する
    - haddockの紹介と使い方
  - ソースコードにテスト可能なサンプルを追加する
    - doctestの紹介と使い方
  - hlint
  - -Wallとか
  - profile

- deploy
  - packageを作成する
    - cab initからpackgeを作成してcabal installできるところまで
  - packageを公開する
    - hackageに登録する流れ

- リスト
  - リストのリテラル定義
    - [], [1], [1,2], [1..3], [1,3..9], [3,2..1] [1..]とその解説
  - 内包表記

- 文字列
  - 文字と文字列のリテラル
    - 'a', "abc"

- 日付
  - Date.Time
  - もっと便利なユーティリティ

- 入出力
  - 文字列を表示する
  - 標準入力から読み込む
  - ファイルから読み込む
  - ファイルに書き込む
  - コマンドライン引数を読み込む
  - コマンドライン引数を簡単にparseしたい
  - 変数を使いたい
    - IORef

- データ型
  - Maybe
  - Either
  - Map
  - IntMap
  - Set
  - IntSet
  - Array
  - ByteString
  - Text
  - Complex
  - Graph
  - HashTable
  - Sequence
  - Tree
  - Vector
  - unordered-containers


- test
  - hunit
  - hspec
  - hspecでquickcheck
  - quickcheck
  - doctest
  - test-framework
  - hpcでカバレッジ測定
  -

- debug
  - 式の途中の値を覗き見したい
    - Debug.Trace.traceを使って値を表示する

- 基本構文
  - module
  - import
  - case
  - guard
  - 関数宣言
  - 型の書き方
  - data
  - type
  - newtype
  - do
  - let
  - where
  - パターンマッチ
  - カリー化
  - ラムダ式
  - $
  - record
  - 型クラス
  - オフサイドルール
  - 演算子のセクションと関数の中置化
  - FFI
  - TemplateHaskell
  - Prelude
  - 演算子の定義

- 標準ライブラリ
  - System.Randomで乱数

- 便利なライブラリ
  - aeson
  - conduit
  - yesod
  - blaze-html
  - regex
  - parsec
  - process-conduit
  - DB
    - mysql
    - sqlite
    - mongoDB
    - persistent
  - GUI
    - gross
    - SDL
  - STM
  - free
  - OpenGL
  - メルセンヌrandomで高速な乱数
  - 擬似乱数

- GHC
  - 実行ファイルを作成する
  - インタプリタとして使う runhaskell
  -

- 便利な拡張
  - ファイルの戦闘にある"{-# #-}"って何よ -拡張を有効に剃る方法-
    - {-# #-}
  - OverloadedStrings
  - record系

- テクニック
  - 部分関数を避ける
  - undefined
  - モナド変換し
  - Applicative
  - SYB

- おすすめの日本語書籍は？
- GHCでできることを知りたい
  - 栄光のグラスゴー
- GHCでできたバイナリのサイズを小さくする
  - stripコマンド, jhc
- Haskell学習者がfollowすべきtwitterアカウント
- lhs
- コンパイルせずに実行したい
  - 3.1 runghc, runhaskell
- module階層について
  - A/B/C.hsとmodule A.B.Cの対応
- 相互に依存したmoduleを読み込むには
  - 4.7.9 hs-boot
- -Wall
- (Linux|Win|Mac)で異なる実装を使いたい
  - Cプリプロセッサ
- GHCのGC制御
  - RTSオプションでメモリ使用量を明示する
- Haskellのコミュニティ
- Haskellの情報源

- GHCi
  - ファイル変更したので再読み込みしたい
    - :reloadコマンドの使い方
  - GHCi上で複数行からなる文を書く
    - 2.4.3 :{ ... :}, :set +m
  - GHCi上でmoduleをimportする
    - 2.4.4 :moduleとimport、そしてその機能の違い
  - GHCi上でコマンドライン引数をためす
    - 2.4.5 :mainとrun, :set args arg...
  - GHCiで一つ前に評価した値を使う
    - 2.4.6 it
  - GHCi上でlet a = 1が(Num a)ではなくIntegerになるわけ
    - 2.4.7 default規則の緩和
  - GHCiでよく使う式を事前に登録して簡単に呼べるようにする
    - :defの使い方
  - GHCi上で言語拡張を有効にする
    - :set -XOverloadedStrings
  - GHCiのプロンプトが長いので短くしたい
    - :set prompt prompt
  - GHCi上でhoogleに尋ねる
    - :!hoogle
  - GHCi上で評価した関数がどのくらいの時間がかかったか知りたい
    - :set +s

- Rubyレシピブックより
  - 006 コメントの書き方
    - --, {- -}
  -

- ruby逆引き
  - ある文字列が一方の文字列の部分文字列かどうか判定したい