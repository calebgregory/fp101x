import Prelude hiding (and)

and :: [Bool] -> Bool
and []     = True
and (b:bs) = b && and bs

and [] = True
and (b : bs)
  | b         = and bs
  | otherwise = False

and [] = True
and (b : bs)
  | b == False = False
  | otherwise  = and bs
