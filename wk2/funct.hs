-- funct :: Int -> [a] -> [a]

funct x xs = take (x + 1) xs ++ drop x xs

test = funct 3 [1, 2, 3, 4, 5, 6, 7]
