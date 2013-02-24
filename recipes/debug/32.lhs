---
title: Hspecの出力形式を変更したい
description: hspecの--formatオプションの使い方について
tags: test, hspec
date: 2013-02-01
---

[Hspec]は、標準では以下の様な形式で標準出力にテスト結果を出力します。
`describe`や`context`に記述された内容が表示され、インデントされて`it`の内容が列挙されています。
失敗したテストには実際の値と期待していた値が別途表示されています。

```bash
$ runghc Test.hs

"xy-sort"
  - "AvEx -> 305027"
  - "A -> 112344"
  - "C -> 999999" FAILED [1]

1) "xy-sort" "C -> 999999" FAILED
expected: "999999"
 but got: "241413"

Finished in 0.0005 seconds
3 examples, 1 failure
```

[Hspec]にはこれを含め４種類の形式をサポートしています。

- specdoc: すべてのテスト結果を表示
- progress: テスト結果一つを'.'か'F'で表示
- failed-examples: 失敗したテストのみ表示
- silent: 何も表示しない。使いドコロが謎
この出力を変更することができます。

progress

```bash
$ runghc Test.hs -f progress
..F
1) "xy-sort" "C -> 999999" FAILED
expected: "999999"
 but got: "241413"

Finished in 0.0005 seconds
3 examples, 1 failure
```

failed-examples

```bash
$ runghc Test.hs -f failed-examples

1) "xy-sort" "C -> 999999" FAILED
expected: "999999"
 but got: "241413"

Finished in 0.0004 seconds
3 examples, 1 failure
```

silent

```bash
$ runghc Test.hs -f silent
```

参考
----

- [Hspec: Behavior-Driven Development for Haskell][Hspec]

[Hspec - Hackage]: http://hackage.haskell.org/package/hspec
[Hspec]: http://hspec.github.com/
