---
title: 定義した型をJSON文字列に変換する
description: aesonライブラリ
tags: library, aeson, json
---

> {-# LANGUAGE DeriveGeneric #-}

> import GHC.Generics
> import Data.Aeson

> data Coord = Coord { x :: Double, y :: Double } deriving (Generic, Show)

> instance FromJSON Coord
> instance ToJSON Coord

> coord = Coord 1 2
> test = encode coord
