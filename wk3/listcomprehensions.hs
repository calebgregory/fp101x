-- the following are equivalent

a = [(x, y) | x <- [1,2,3], y <- [4,5,6]]

b = [z | z <- [(x, y) | x <- [1,2,3], y <- [4,5,6]]]

c = concat [[(x, y) | y <- [4,5,6]] | x <- [1,2,3]]
