myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && (berbAnd xs)

myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (x:xs) = x ++ (myConcat xs)

myReplicate :: Int -> a -> [a]
myReplicate 0 _ = []
myReplicate n a =
    [a] ++ (myReplicate (n-1) a)

myBang :: [a] -> Int -> a
myBang (x:_) 0 = x
myBang (_:xs) n =
    myBang xs (n-1)

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs) = 
    a == x || (myElem a xs)