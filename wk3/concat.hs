import Prelude hiding ((++),concat)

-- just for kicks & gigs
(++) :: [a] -> [a] -> [a]
[]     ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)

concat         :: [[a]] -> [a]
concat []       = []
concat (xs:xss) = xs ++ concat xss

test = concat [["a","b"],["c","d"],["e","f"]]
