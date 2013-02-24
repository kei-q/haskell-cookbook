
import Text.Printf
import Control.Applicative

main :: IO ()
main = mapM_ f [1..12]

f :: Int -> IO ()
f n = do
  let s = printf "%02d.lhs" n
  let date = printf "2013-01-%02d" n
  let file = date ++ "-1.lhs"
  contents <- lines <$> readFile file
  let a = take 4 contents
  let b = drop 4 contents
  writeFile s $ unlines a ++ "date: " ++ date ++ "\n" ++ unlines b
