isPythagorean :: (Num a, Eq a) => (a,a,a) -> Bool
isPythagorean (x,y,z) = x^2 + y^2 == z^2

pyths :: Int -> [(Int,Int,Int)]
pyths n =
    [(x,y,z) | 
    x <- [1..n],
    y <- [1..n],
    z <- [1..n],
    isPythagorean (x,y,z)]

-------
factors n =
    [x | 
    x <- [1..n], 
    n `mod` x == 0,
    x /= n
    ]

isPerfect :: Int -> Bool
isPerfect n =
    n == sum (factors n)

perfects :: Int -> [Int]
perfects n =
    [x |
    x <- [1..n],
    isPerfect x]