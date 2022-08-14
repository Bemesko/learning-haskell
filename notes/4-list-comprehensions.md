# Lesson 4 - List Comprehensions

## Introducing List Comprehensions

- Inspired by set comprehensions, a mathematical notation that can be used to construct new sets from old sets
- In Haskell, a similar notation can be used to construct new lists from old lists:

```haskell
[x^2 | x <- [1..5]]
```

The above can be used to create the list `[1,4,9,16,25]`


### Lists vs. Sets

- In a set, the order and duplicity of elements doesn¹t matter, all that matters is if a particular matter is in the set

## Generators

- The expression `x <- [1..5]` is called a generator, as it states how to generate values for x
- Comprehensions can have *multiple* generators, separated by commas. Example:

```haskell
[(x,y) | <- [1,2,3], y <- [4,5]]
--Generates:
--[(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]
```

- Changing the order of generators changes the order of the elements in the final list
- You can think of multiple generators are nested loops, with later generators as more deply nested loops whose variables change value more frequently

### Dependant Generators

- Later generators can depend on the variables that are introduced by earlier generators

```haskell
[(x,y) | x <- [1..3], y <- [x..3]]
--Generates:
--[(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]
```

## Guards

Guards can be used to restrict the values produced by earlier generators.

```haskell
[x | x <- [1..10], even x]
```

The example above generates a list `[2,4,6,8,10]` of all numbers `x` such that `x` is an element of the list `[1..10]` **and** `x` is even

## Zip Function

- `zip` is a function of the common library which maps two lists to a list of pairs of their corresponding elements

```haskell
zip :: [a] -> [b] -> [(a,b)]
```

- Using `zip` we can define a function which returns the list of all pairs of adjacent elements from a list:

```haskell
pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)
```

Using this `pairs` function we can define a function that decides if the elements in a list are *sorted*:

```haskell
sorted :: Ord a -> [a] -> Bool
sorted xs = and [x <= y | (x,y) <- pairs xs]
```

We can also make a function that returns all positions of a value in a list:

```haskell
positions :: Eq a => a -> [a] -> [Int]
positions x xs =
    [i | (x', i) <- zip xs [0..], x == x']
```

## String Comprehensions

- Strings are internally represented as lists of characters
- Any polymorphic function that operates on lists can also be applied to strings
- List comprehensions can allso be used to define functions on strings:

```haskell
count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']
```

---

## The 3 C's

In Haskell, you only need to worry about writing code that is:

1. Clear
2. Correct
3. Concise

Let the compiler take care of performance because it is very good at doing it