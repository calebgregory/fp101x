-- Return a list of divisors for a natural number n.
  -- > divisors 15
  -- [1, 3, 5, 15]

-- Helper
  -- > divides 15 2
  -- False
  -- > divides 15 3
  -- True
divides :: Int -> Int -> Bool
divides = \ x -> \ y -> x `rem` y == 0

divisors :: Int -> [Int]
divisors = \ n -> [x | x <- [1..n], n `divides` x]
