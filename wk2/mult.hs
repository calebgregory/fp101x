mult = \ x -> (\ y -> (\ z -> x * y * z))

test = mult 1 2 3
