-- scalarproduct :: [Int] -> [Int] -> Int
-- The scalar product of two lists of integers xs and ys of length n
-- is given by the sum of the products of the corresponding integers
-- sum ( (xs !! i) * (ys !! i ) for i = 0 to n-1
  -- > scalarproduct [1,2,3] [4,5,6]
  -- 32
  -- ( 1*4 + 2*5 + 3*6 ) => ( 4 + 10 + 18 )
scalarproduct = \ xs -> \ ys ->
  sum [x * y | (x, y) <- xs `zip` ys]

-- Alternately,
scalarproduct2 = \ xs -> \ ys ->
  sum (zipWith (*) xs ys)
