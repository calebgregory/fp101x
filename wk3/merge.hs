-- Merges two sorted lists in ascending order to give
-- a single sorted list in ascending order, e.g.,
  -- > merge [2, 5, 6] [1, 3, 4]
  -- [1, 2, 3, 4, 5, 6]

merge :: Ord a => [a] -> [a] -> [a]
merge xs     []     = xs
merge []     ys     = ys
merge (x:xs) (y:ys)
  | x <= y          = x : merge xs (y:ys)
  | otherwise       = y : merge (x:xs) ys
