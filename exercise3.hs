-- 1. create safetail function that is just like tail but doesn't give an error with []

safetail :: Eq a => [a] -> [a]
safetail xs | xs == []  = []
            | otherwise = tail xs

safetail2 :: [a] -> [a]
safetail2 xs | null xs = []
             | otherwise = tail xs

safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 b = tail b

safetail4 :: [a] -> [a]
safetail4 a = if null a then [] else tail a