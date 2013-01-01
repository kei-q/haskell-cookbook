---
title: literate haskell
description: test
tags: basics
---



\begin{code}
main :: IO ()
main = do
  line <- getLine
  putStrLn line
\end{code}

\begin{code}
main' :: IO ()
main' = getLine >>= putStrLn
\end{code}

参考
----

