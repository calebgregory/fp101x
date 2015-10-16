-- several ways to do a quicksort, but reverse

rqsort []     = []
rqsort (x:xs) = rqsort larger ++ [x] ++ rqsort smaller
  where
    larger  = [a | a <- xs, a > x]
    smaller = [b | b <- xs, b <= x]

rqsort1 []     = []
rqsort1 (x:xs) = rqsort1 larger ++ [x] ++ rqsort1 smaller
  where
    larger  = [a | a <- xs, a > x || a == x]
    smaller = [b | b <- xs, b < x]

rqsort2 [] = []
rqsort2 (x:xs)
  = reverse
    (reverse (rqsort2 smaller) ++ [x] ++ reverse (rqsort2 larger))
  where
    larger  = [a | a <- xs, a > x]
    smaller = [b | b <- xs, b <= x]
