-- remove :: Int -> [a] -> [a]
-- takes a number n and a list and removes the element at position n from the list

remove n xs = take n xs ++ drop (n + 1) xs

remove = \ n -> \ ys -> take n ys ++ drop (n + 1) ys

test = remove 0 [1, 2, 3, 4]
test1 = remove 2 [1, 2, 3, 4]
