-- find :: (Eq a) => a -> [(a,b)] -> [b]
find k t = [v | (k', v) <- t, k == k']

-- positions :: (Eq a) => a -> [a] -> [Int]
positions x xs =
  find x (zip xs [0..n])
  where n = length xs - 1

-- alternatively,
positions2 x xs =
  [i | (x', i) <- zip xs [0..n], x == x']
  where n = length xs - 1

-- should refurn ["a","c","d"]
test = find 1 [(1,"a"),(0,"b"),(1,"c"),(1,"d"),(0,"e")]
test1 = positions 1 [1,0,1,1,0,1]
