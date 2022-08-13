double x = x + x

quadruple x = double (double x)

factorial n = product [1..n]

--x `div` y is the same as div x y
average numbers = sum numbers `div` length numbers

--exercise 2:
n = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]

--exercise 3: define the last function

myLast ns = head (reverse ns)

--exercise 4: define last in another way
myOtherLast ns = drop (length ns - 1) ns

--exercise 5: rewrite init (remove last element of a list)
myInit ns = reverse (drop 1 (reverse ns))