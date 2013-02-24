---
title: GHCi上でimportするとプロンプトが長くなるのをどうにかする
description: :set promptでプロンプト文字列を変更します
tags: ghci
date: 2013-01-19
---

新しくinstallしたlibraryをちょっと試すときなど、GHCiを起動して
importすると、GHCiではプロンプトにそのmodule名を表示します。
数が多くなったり、長い名前のmoduleをimportするとプロンプトが表示領域を
圧迫し、作業しづらくなります。

```bash
Prelude> import Data.List
Prelude Data.List> import Control.Applicative
Prelude Data.List Control.Applicative> import Control.Monad
Prelude Data.List Control.Applicative Control.Monad>
...
```

GHCiではプロンプトの文字列を任意のものに変更できるので、適当な値に設定すれば
プロンプトが横に長くなることはありません。

```bash
Prelude> :set prompt "> "
> import Data.List
>
```

しかしこれではimportしたmoduleが確認できません。プロンプトでこれまで表示していた
moduleのリストを表示したいときは、プロンプトの文字列に`%s`を含めることで
表示することができます。改行と組み合わせて複数行プロンプトを表示すれば
入力欄が横に伸びることはなくなるので幾分快適に作業することができるようになります。

```bash
Prelude> :set prompt "[%s]\n> "
[Prelude]
> import Data.List
[Prelude Data.List]
>
```

上記の設定が気に入って、常時これを有効にしたいときは.ghciというファイルを
事前に用意しておくことで、設定を常に有効にすることができます

```bash
$ cat ~/.ghci
:set prompt "[%s]\n> "

$ ghci
GHCi, version 7.4.2: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
[Prelude]
>
```

参考
----

- [2.7. GHCiのコマンド群](http://www.kotha.net/ghcguide_ja/latest/ghci-commands.html)
- [2.9. .ghciファイル](http://www.kotha.net/ghcguide_ja/latest/ghci-dot-files.html)