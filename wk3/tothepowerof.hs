import Prelude hiding ((^))

-- for non-negative Integers n
(^) :: Int -> Int -> Int
m ^ 0 = 1
m ^ n = m * m ^ (n - 1)

m ^ 0 = 1
m ^ n = m * (^) m (n - 1)
