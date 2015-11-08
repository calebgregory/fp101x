# Higher-Order Functions

a function is called _higher-order_ iff it takes a function as an
argument or returns a function as a result.

e.g.,
```
twice :: (a -> a) -> a -> a
twice f x = f (f x)
-- (takes a function as its first argument)
```

twice = \f -> \x -> f (f x)

## Why are they useful?

- _common programming idions_ can be encoded as functions within the
language itself

- _domain specific languages_ can be defined as collections of
higher-order functions (APIs)

- _algebraic properties_ of higher-order functions can be used to reason
about programs. these properites hold irrespective of what parameters
you pass to them.

## the map function

the higher order library function called `map` applies a function to
every element of a list

```
map :: (a -> b) -> [a] -> [b]
-- for example,
> map (+1) [1,3,5,7]
[2,4,6,8]
```

the map function can be defined in a particularly simple manner using a
list comprehension:

```
map f xs = [f x | x <- xs]
```
alternatively, for the purposes of proofs, it can also be defined using
recursion:
```
map f []     = []
map f (x:xs) = f x : map f xs
```

## the filter function

the higher order library function called `filter` selects every element
from a list that satisfies a predicate.

```
filter :: (a -> Bool) -> [a] -> [a]
-- for example
> filter even [1..10]
[2,4,6,8,10]
```

Similarly to `map`, `filter` can be defined in two ways:
```
-- defn with list comprehension
filter p xs = [x | x <- xs, p x]
-- defn with recursion
filter p []     = []
filter p (x:xs)
  | p x         = x : filter p xs
  | otherwise   = filter p xs
```
## foldr

the functions `map` and `filter` have a similar structure - they're both
defined inductively over the structure of the list.

since we are _lazy_ programmers, we want to capture that pattern into
yet another higher-order function, that we can then use to define filter
and map - or, in fact, as many functions as possible. that function that
captures recursively descending over the structure of a list is called
`foldr`. there is also a function `foldl`. the `l` and `r` here simply
indicate the direction of the fold - from left or right, respectively.

```
f []     = v
f (x:xs) = x (+) f xs
-- f maps the empty list to some value v,
-- and any non-empty list to some function (+) applied to its head
  -- and f of its tail
```
`f` traverses the list and replaces the empty list with `v`, and that
replaces every occurrence of `cons` with`(+)`. /here `(+)` is not
signifying the function 'plus' but rather is a general placeholder for
any function, e.g. `(*)`, `:`, or `++`./

`f` is a homomorphism over the list - it respects the structure of the
list.

the higher-order library function `foldr` (fold right) encapsulates this
simple pattern of recursion with the function `(+)` and the value `v` as
its arguments.

Here are a few examples:
```
sum []     = 0                   -- v   = 0
sum (x:xs) = x + sum xs          -- (+) = +

product []     = 1               -- v   = 1
product (x:xs) = x * product xs  -- (+) = *

and []     = True                -- v   = True
and (x:xs) = x && and xs         -- (+) = &&
```
redefined using `foldr`:
```
sum     = foldr (+) 0

product = foldr (*) 1

or      = foldr (||) False

and     = foldr (&&) True
```
looking at these functions, we can see that these are just instances of
`foldr` with a particular `v` and a particular `(+)`.

in review,
```
f []     = v          -- f maps the empty list to some value v
f (x:xs) = x (+) f xs -- and any non-empty list to some function (+)
                        -- applied to its head and f of its tail
```
`foldr` can itself be defined using recursion:
```
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f v []     = v
foldr f v (x:xs) = f x (foldr f v xs)
```

(however, it is best to think of `foldr` non-recursively, as
simultaneously replacing each `(:)` in a list by a given function, and
`[]` by a given value) . . .

using this line of reasoning, we can say that `foldr` takes as its first
parameber an operation that replaces `cons` - a function of type `(a ->
b -> b)`. the second parameter is the value `v` (of type `b`) that
replaces `[]`. Then we get a function `[a] -> b`.

for example,
```
sum [1,2,3]
= foldr (+) 0 [1,2,3]
= foldr (+) 0 (1:(2:(3:[]))) -- replace each (:) with (+) and [] with 0
= 1+(2+(3+0))
= 6
```
`foldr` is very similar to the 'visitor pattern'. it 'visits' the list
and for every constructor, it applies a function, and that function is
passed as the parameters to `foldr`.
```
product [1,2,3]
= foldr (*) 1 [1,2,3]
= foldr (*) 1 (1:(2:(3:[]))) -- replace each (:) with (*) and [] with 1
= 1*(2*(3*1))
= 6
```

### other foldr examples
even though `foldr` encapsulates a simple pattern of recursion, it can
be used to define many more functions than might be first expected.

recall
```
length       :: [a] -> Int
length []     = 0
length (_:xs) = 1 + length xs
```
it can be defined
```
length [1,2,3]
= length (1:(2:(3:[])))
= 1+(1+(1+0)) -- replaces each (:) by (\_ n -> 1 + n) and [] by 0
= 3
-- hence,
length = foldr (\_ n -> 1+n) 0
```
now recall,
```
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]
```
it can be defined

```
reverse [1,2,3]
= reverse (1:(2:(3:[])))      -- replace each (:) with (\x xs ->
= (([] ++ [3]) ++ [2]) ++ [1] -- xs ++ [x]) and [] with [].
= [3,2,1]
-- hence,
reverse = foldr (\x xs -> xs ++ [x]) []
```
finally, we note that the append function `(++)` has a particularly
compact definition using `foldr`:
```
(++ ys) = foldr (:) ys -- replace each (:) by (:) and [] by ys
```
now if we write this in pointfree style,

### why is foldr useful?
- some recursive functions on lists, such as `sum` are _simpler_ to
  define using `foldr`.
- properties of functions defined using `foldr` can be proved using
  algebraic properties of `foldr`, such as _fusion_ and the _banana
split_ rule.
- advanced program _optimizations_ can by simplr if `foldr` is used in
  place of explicit recursion.

in particular, `fusion` means that I have two functions - one that uses
`foldr` to traverse one list and return another list, and if I do
another `foldr` on the result of that, I can fuse these two together,
such that the intermediate list is never constructed - so programs can
be optimized if you write them in this higher-order pattern.

## composition

the library function (.) returns the _composition_ of two functions as a single
function.

```
(.)  :: (b -> c) -> (a -> b) -> (a -> c)
f . g = \x -> f (g x)
```
the order of `(b -> c) -> (a -> b)` here has to do with the way that function
application associates. the composition `f (g x)` evaluates first `(g x)` and
then applies `f` to the result.

if the above, `f :: (b -> c)` and `g :: (a -> b)`, and therefore, `f . g :: (a
-> c)`.

for example,
```
odd :: Int -> Bool
odd  = not . even
-- this definition uses 'pointfree' style.
```

in OOP, we have objects that have methods we can call on them (using the (.)
notation), while in Haskell, we have functions that we can compose.

warning: using pointfree style is nice because it enables you to write things
very compactly. the cost of this, however, is that your code becomes difficult
to read. protip: use composition sparingly because you always have to write
code for others to read.

## all
the function `all` decides if every element of a list satisfies a given predicate.
```
all     :: (a -> Bool) -> [a] -> Bool
all p xs = and [p x | x <- xs]
-- for example,
> all even [2,4,6,8,10]
True
```

## any
dually, the library function `any` decides if at least one element of a list
satisfies a predicate.
```
any     :: (a -> Bool) -> [a] -> Bool
any p xs = or [p x | x <- xs]
-- for example,
> any isSpace "abc def"
True
```

## takeWhile
`takeWhile` selects elements from a list while a predicate holds of all the
elements.
```
takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile p []     = []
takeWhile p (x:xs)
  | p x            = x : takeWhile p xs
  | otherwise      = []
-- for example,
> takeWhile isAlpha "abc def"
"abc"
```

## dropWhile
dually, the function `dropWhile` removes elements while a predicate holds of
all the elements.
```
dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile p []     = []
dropWhile p (x:xs)
  | p x            = dropWhile x xs
  | otherwise      = x:xs
-- for example,
> dropWhile isSpace "   abc"
"abc"
```

"Don't be fooled by the name; the idea is what matters."
