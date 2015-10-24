-- several ways to define the conjunction operator

import Prelude hiding ((&&))

True && True = True
_ && _       = False

a && b = if a then if b then True else False else False

a && b = if a then b else False

a && b = if b then a else False

a && b
  | a == b = a
  | otherwise = False

a && b
  | a == b = b
  | otherwise = False

test = [
  ("F && F", False && False),
  ("F && T", False && True),
  ("T && F", True  && False),
  ("T && T", True  && True)]
