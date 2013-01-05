---
title: 文字列をファイルに書き込む
description: writeFileを使って指定したファイルに文字列を保存します
tags: basics, file
---

文字列をファイルに書き込むには`writeFile`を使います。

> -- writeFile :: FilePath -> String -> IO ()
> test1 :: IO ()
> test1 = writeFile "test.txt" "hoge"

参考
----

- [writeFile - Hoogle](http://www.haskell.org/hoogle/?hoogle=writeFile)
