-- pyths :: Int -> [(Int, Int, Int)]
-- A triple (x,y,z) of positive integers is pythagorean iff x^2 + y^2 = z^2.
  -- pyths should return a list of all pythagorean triples whose components
  -- are at most a given limit n.
    -- > pyths 10
    -- [(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10)]
pyths
  = \ n ->
    [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n],
     x^2 + y^2 == z^2]
