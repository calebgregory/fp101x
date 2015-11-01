length       :: [a] -> Int
length []     = 0
length (_:xs) = 1 + length xs

{-
  length [1,2,3]
  = { applying length }
  1 + length [2,3]
  = { applying length }
  1 + (1 + length [3])
  = { applying length }
  1 + (1 + (1 + length []))
  = { applying length }
  1 + (1 + (1 + 0))
  = { applying + }
  1 + (1 + 1)
  = { applying + }
  1 + 2
  = { applying + }
  3
-}
