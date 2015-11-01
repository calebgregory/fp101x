import Prelude hiding (init)

init       :: [a] -> [a]
init [_]    = []
init (x:xs) = x : init xs

{-
  init [1,2,3]
  = { applying init }
  1 : init [2,3]
  = { applying init }
  1 : (2 : init [3])
  = { applying init }
  1 : (2 : [])
  = { list notation }
  [1,2]
-}
