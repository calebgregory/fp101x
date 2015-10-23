-- fn safetail :: [a] -> [a]
-- behaves just like lib fn `tail` except that `safetail` maps [] -> [],
-- whereas `tail` produces an ERROR in this case

safetail1 xs = if null xs then [] else tail xs

safetail2 []     = []
safetail2 (_:xs) = xs

safetail3 xs
  | null xs   = []
  | otherwise = tail xs

safetail4 [] = []
safetail4 xs = tail xs

safetail5
  = \ xs ->
      case xs of
        []     -> []
        (_:xs) -> xs

xs = [1, 2, 3, 4]
emp = []
