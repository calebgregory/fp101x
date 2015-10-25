-- odds :: Int -> [Int]
-- returns the first n odds

odds n = map f [0..n-1]
  where f x = x * 2 + 1

-- defined using lambda notation
odds n = map (\ x -> x * 2 + 1) [0..n-1]
