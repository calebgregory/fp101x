-- perfects :: Int -> [Int]
-- A positive integer is perfect iff it equals the sum of its factors,
-- excluding the number itself. perfects returns the list of all
-- perfect numbers up to a given limit.
  -- > perfects 500
  -- [6, 28, 496]
factors
  = \ n ->
    [x | x <- [1..n], n `mod` x == 0]

perfects
  = \ n ->
    [x | x <- [1..n], x == sum (init (factors x))]

-- alternatively,
perfects'
  = \ n ->
    [x | x <- [1..n], isPerfect x]
    where isPerfect = \ a ->
            sum (init (factors a)) == a
