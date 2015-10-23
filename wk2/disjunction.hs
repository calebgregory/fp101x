-- some definitions for OR

import Prelude hiding ((||))

False || False = False
_ || _         = True

False || b = b
True  || _ = True

b || False = b
_ || True  = True

b || c
  | b == c = b
  | otherwise = True

b || c
  | b == c = c
  | otherwise = True

test = [
  ("F || F", False || False),
  ("F || T", False || True),
  ("T || F", True  || False),
  ("T || T", True  || True)]
