-- Implemntation of a merge sort.
-- [] and [a] are already sorted,
-- and any other list is sorted by merging together
-- the two lists that result from sorting the two halves of the list separately.

halve :: [a] -> ([a],[a])
halve xs = splitAt (length xs `div` 2) xs

merge :: Ord a => [a] -> [a] -> [a]
merge xs []   = xs
merge [] ys   = ys
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

msort :: Ord a => [a] -> [a]
msort []  = []
msort [a] = [a]
msort xs  = merge (msort ys) (msort zs)
  where (ys, zs) = halve xs


test = msort [10,2,5,1,9,4,3,6,8,7]
