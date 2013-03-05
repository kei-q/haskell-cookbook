---
title: tarを扱う
description: tarパッケージでtarballを処理します
tags: library
date: 2013-03-05
---

Haskellで`hoge.tar`のようなファイルを扱うときは[tar]パッケージを使用します。
このパッケージは標準ライブラリに含まれていないため、以下の手順で導入します。

```bash
$ cabal update
$ cabal install tar
```

必要な関数を呼べるようにするために、以下のimportを加えます。
名前が被る可能性があるため、`qualified`をつけています。

> import qualified Codec.Archive.Tar as Tar

また、ファイルの中身がByteStringで表現されているため、以下も加えてimportしておきます。

> import qualified Data.ByteString.Lazy as BS

tarを作成・展開するための用途として、`Tar.create`{.hoogle}と`Tar.extract`{.hoogle}という高レベルの関数が用意されています。

tarを作成する場合は`create`を呼びます。引数は順に以下のようになっています。

- 作成するxxx.tarの名前
- ベースとなるディレクトリ
- tarに含めるファイル名のリスト

```bash
ghci> :!ls
fuga.txt        hoge.txt
ghci> Tar.create "piyo.tar" "." ["hoge.txt", "fuga.txt"]
ghci> :!ls
fuga.txt        hoge.txt        piyo.tar
```

tarを展開したい場合は`extract`を呼びます。引数は以下のとおりです。

- 出力先ディレクトリ
- 展開するtarballのファイル名

```bash
ghci> Tar.extract "dest" "piyo.tar"
ghci> :!ls dest
fuga.txt        hoge.txt
```

上記の方法でtarの作成・展開はできますが、型の最後が`IO :: ()`となっていることからも
わかるとおり、ファイルが生成されてしまいます。様々な処理を行うために、もう少し低いレベルの関数として以下が用意されています。

関数                  機能
----                  ----
`Tar.read`{.hoogle}   `.tar`を読み込んでEntriesを出力
`Tar.write`{.hoogle}  Entryのリストを読んで`.tar`形式のByteStringに変換
`Tar.pack`{.hoogle}   選択したファイルをまとめる
`Tar.unpack`{.hoogle} Entriesを元にファイルとディレクトリを作成

これらの関数を使うと、前述の`create`と`extract`は以下のように表現できます。

> create' :: FilePath -> FilePath -> [FilePath] -> IO ()
> create' tar base paths = BS.writeFile tar . Tar.write =<< Tar.pack base paths
> extract' :: FilePath -> FilePath -> IO ()
> extract' dir tar = Tar.unpack dir . Tar.read =<< BS.readFile tar

参考
----

- [tar]

[tar]: http://hackage.haskell.org/package/tar-0.4.0.1