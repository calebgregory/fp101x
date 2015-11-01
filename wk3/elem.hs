import Prelude hiding (elem)

-- Is this value an element of a list?

elem :: Eq a => a -> [a] -> Bool
elem _ []     = False
elem a (x:xs)
  | a == x    = True
  | otherwise = elem a xs
