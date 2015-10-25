e3 x = x * 2

e4 (x,y) = x

e5 (x,y,z) = z

e6 x y = x * y

e7 (x, y) = (y, x)

e8 x y = (y, x)

e9 [x,y] = (x, True)

e10 (x, y) = [x, y]

second xs = head (tail xs)

swap (x, y) = (y, x)

pair x y = (x, y)

double x = x * 2

palindrome xs = reverse xs == xs

twice f x = f (f x)
