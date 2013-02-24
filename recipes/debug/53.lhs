---
title: 言語拡張を有効にする
description: 言語拡張を有効にする３つの方法
tags: GHC
date: 2013-02-22
---

GHCには、[Haskellの仕様][Haskell2010]に含まれていないけれど(便利|実験的)なさまざまな機能を提供しています。
例えば、`OverloadedStrings`や`TemplateHaskell`は見たことがある方も多いかと思います。
それらはdefaultでは有効にはなっていないため、これらの機能を使うときは以下のいずれかの方法で明示する必要があります。

- ファイルの中に`LANGUAGE`プラグマで指定する
- コンパイル時のオプションで指定する
- .cabalに有効にする拡張を指定する

ファイル単位で言語拡張を有効にする場合は、ファイルの先頭に有効にする拡張を記述します。

```haskell
{-# LANGUAGE OverloadedStrings #-}
```

コンパイル時のオプションで指定する場合は、`-X{option}`という形で指定します。
指定できるオプションは[4.20.12. 言語オプション]で確認できます。

```bash
$ ghc -XOverloadedStrings Main.hs
```

cabalを使用している場合、`hoge.cabal`の中に`extensions`という項目を用意し、そこに拡張の名前を列挙します。

```yaml
...
extensions: OverloadedStrings
...
```

ちなみに、GHCiで試したいときは`:set`を使うことで有効にすることができます。

```bash
ghci> :set -XOverloadedStrings
```

参考
----
- [第7章 GHCの言語機能]
- [4.20.12. 言語オプション]
- [Haskell2010]
- [Cabal - Build informaiton]

[第7章 GHCの言語機能]: http://www.kotha.net/ghcguide_ja/latest/ghc-language-features.html
[4.20.12. 言語オプション]: http://www.kotha.net/ghcguide_ja/latest/flag-reference.html#idm140193857020736
[Haskell2010]: http://www.haskell.org/onlinereport/haskell2010/
[Cabal - Build informaiton]: http://www.haskell.org/cabal/users-guide/developing-packages.html#build-information
