-- a few different ways to halve a list xs
halve1 xs = splitAt (length xs `div` 2) xs

halve2 xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
  where n = length xs

halve3 xs = splitAt (div (length xs) 2) xs

halve4 xs = (take n xs, drop n xs)
  where n = length xs `div` 2

-- stated condition : xs is even-lengthed
xs = [1, 2, 3, 4, 5, 6]
