{-
  foldl (\x y -> 2*x + y) 4 [1,2,3]
  = { applying (\x y -> 2*x + y), (x,y)=(4, 1) }
  2*(4) + 1 = 9
  = { applying (\x y -> 2*x + y), (x,y)=(9, 2) }
  2*(9) + 2 = 20
  = { applying (\x y -> 2*x + y), (x,y)=(20,3) }
  2*(20) + 3 = 43
-}
