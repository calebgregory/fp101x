-- sum100 = Int
-- sum ( 1^2, 2^2, ... , 100^2 )
sum100 = sum [x^2 | x <- [1..100]]
