---
title: darcsで管理されているprojectのコードを取得する
description: Haskell製patch管理システムのdarcsについて
tags: devtool
date: 2013-03-04
---

Haskellのバージョン管理システムに[darcs]があります。
[xmonad]を始め、いくつかのprojectはdarcsで管理されているものがあり、コードを取得したいときはdarcsをinstallする必要があります。

darcsはhackageに登録されているので、以下の手順でinstallすることができます。

```bash
$ cabal update
$ cabal install darcs
```

darcsで管理されているものを取得する場合、`darcs get`を使います。
xmonadというHaskell製window managerのコードを取得する場合は以下のように入力します。

```bash
$ darcs get http://code.haskell.org/xmonad
```

参考
----

- [darcs]
- [hub.darcs.net]

[darcs]: http://darcs.net/
[hub.darcs.net]: http://hub.darcs.net/