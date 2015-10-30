-- takes two lists of the same length and interleaves their elements
-- in turn about order
  -- > riffle [1, 2, 3] [4, 5, 6]
  -- [1, 4, 2, 5, 3, 6]
riffle :: [a] -> [a] -> [a]
riffle = \ xs -> \ ys ->
  concat[[x, y] | (x, y) <- xs `zip` ys]

test = riffle [1,2,3] [4,5,6]
