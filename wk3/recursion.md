# Recursion
factorial :: Int -> Int
factorial n = product [1..n]

Expressions are evaluated by a stepwise process of applying functions to
their arguments

  e.g.,
```
    factorial 4 = product [1..4]
                = product [1,2,3,4]
                = 1 * 2 * 3 * 4
```

In Haskell, functions can also be definied in terms of themselves. Such
functions are called _recursive_.

factorial 0 = 1
factorial n = n * factorial (n - 1)

  e.g.,
```
    factorial 3
  = 3 * factorial 2
  = 3 * (2 * factorial 1)
  = 3 * (2 * (1 * factorial 0))
  = 3 * (2 * (1 * 1))
  = 3 * (2 * 1)
  = 3 * 2
  = 6
```

### Note

factorial 0 = 1 is appropriate because 1 is the identity for
multiplication : ( 1 * x ) = x = ( x * 1 )

The recursive definition _diverges_ on integers < 0 because the base
case is never reached

  > factorial (-1)
  Exception: stack overflow

## Why is recursion useful?

Some functions, such as factorial, are _simpler_ to define in terms of
other functions.

As we shall see, however, many functions can _naturally_ be defined in
terms of themselves.

Properties of functions defined using recursion can be proved using the
simple but powerful mathematical tecnique of _induction_.

## Recursion on lists

Recursion is not restricted to numbers, but can also be used to define
functions on _lists_.

  e.g.,
```
    product       :: [Int] -> Int
    product []     = 1
    product (n:ns) = n * product ns


  product [2,3,4]
  = 2 * product [3,4]
  = 2 * (3 * product [4])
  = 2 * (3 * (4 * product []))
  = 2 * (3 * (4 * 1))
  = 24

    length       :: [a] -> Int
    length []     = 0
    length (_:xs) = 1 + length xs

    reverse       :: [a] -> [a]
    reverse []     = []
    reverse (x:xs) = reverse xs ++ [x]

  reverse [2,3,4]
  = reverse [3,4] ++ [2]
  = (reverse [4] ++ [3]) ++ [2]
  = ((reverse [] ++ [4]) ++ [3]) ++ [2]
  = (([] ++ [4]) ++ [3]) ++ [2]
  = ([4] ++ [3]) ++ [2]
  = [4,3] ++ [2]
  = [4,3,2]

```

## Multiple arguments

Functions with more than one argument can be defined using recursion.

e.g.,
```
-- zipping the elements of two lists
zip              :: [a] -> [b] -> [(a,b)]
zip []     _      = []
zip _      []     = []
zip (x:xs) (y:ys) = (x,y) : zip xs ys

drop         :: Int -> [a] -> [a]
drop 0 xs     = xs
drop _ []     = []
drop n (_:xs) = drop (n-1) xs

(++)        :: [a] -> [a] -> [a]
[]     ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)
```

## Quicksort

The quicksort algorithm for sorting a list of integers can be specified
by the following two rules:

- An empty list is already sorted;
- Non-empty lists can be sorted by sorting the tail values <= the head,
  sorting the tail values > the head, and appending the resulting lists
  on either side of the value.

In the real implementation, we don't want to create new lists, but
mutate the data structure in place to swap the elements in a sorted
manner. This version does not show recursion, though.

```
qsort :: [Int] -> [Int]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where smaller = [a | a <- xs, a <= x]
        larger  = [b | b <- xs, b > x]

q = qsort

  q [3,2,4,1,5]                                    ||     [3]
  |                                                ||      v
  +-> q [2,1] ++ [3] ++ q [4,5]                    || [1,2,3,4,5]
      |                 :                          ||  ^ ^   ^ ^
      +-> q [1] ++ [2] ++ q []                     || [1,2]  ^ ^
          |             : |                        ||        ^ ^
          +-> [1]       : +-> []                   ||        ^ ^
                        :                          ||        ^ ^
                        +-> q [] ++ [4] ++ q [5]   ||       [4,5]
                            :              :       ||
                            +-> []         +-> [5] ||
```

## Others

```
replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n a = a : replicate (n-1) a

(!!) :: [a] -> Int -> a
(!!) (x:xs) 0 = x
(!!) (_:xs) n = (!!) xs (n-1)

elem :: Eq a => a -> [a] -> Bool
elem a [] = False
elem a (x:xs)
  | x == a    = True
  | otherwise = elem a xs
```
