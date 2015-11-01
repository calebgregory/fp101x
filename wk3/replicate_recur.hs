import Prelude hiding (replicate)

replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n x = x : replicate (n - 1) x

test = replicate 3 'x'
