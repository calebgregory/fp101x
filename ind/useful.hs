-- length :: [a] -> Int
myLength xs = sum [1 | _ <- xs]

myLengthL = \ xs -> sum [1 | _ <- xs]

pairings xs ys = [(x, y) | x <- xs, y <- ys]

pairingsL = \ xs -> \ ys -> [(x,y) | x <- xs, y <- ys]

allPossibleOrderedPairings = \ xs -> [(x,y) | x <- xs, y <- [x..(length xs)]]

-- concat :: [[a]] -> [a]
myConcat = \ xss -> [x | xs <- xss, x <- xs]

