# Lesson 3 - Defining Functions

## Conditional Expressions

Functions can be defined using conditional expressions:

    abs :: Int -> Int
    abs n = if n >= 0 then n else -n

- Note that it isn't necessary to write the `return` keyword
- Conditional expressions can be nested
- An `if` **always** has to have an `else` in Haskell
  - This avoids amibiguity within nested conditionals (dangling else problem)

## Guarded Equations

This is another way to define the behavior of a function

    abs n | n > 0    = n
          | otherwise = -n

- You can think of the `|` as saying *such that*
- Guarded equations are useful because they can make multiple conditions simple to read (no nested `if`s!)
- `otherwise` is just an alias to `True`, so that gives an insight on how Haskell evaluates each condition

## Pattern Matching

This is yet another way to define functions that maps each input to a particular output.

    not :: Bool -> Bool
    not False = True
    not True = False

The same function can often be defined by multiple ways using pattern matching. Example below:

    (&&) :: Bool -> Bool -> Bool
    True && True = True
    False && True = False
    True && False = False
    False && False = False

This can be simplified by writing:

    (&&) :: Bool -> Bool -> Bool
    True && True = True
    _    && _    = False

- The `_` is a wildcard pattern that matches any argument value

    (&&) :: Bool -> Bool -> Bool
    True && b = b
    False && _ = False

- The above is a more efficient way of defining the && operator, because Haskell is lazy and will return False if just the first input is false

### Further Considerations

- Patterns are always evaluated in order, so keep your `_` for the last ones
- Patterns cannot repeat variables

## List Patterns

- Haskell builds every non-empty list using the `:` (con) operator several times.
  - This operator adds an element to the start of a list

        [1,2,3,4] means 1:(2:(3:(4:[])))

- The con operator can be used to take apart lists the same way it is used to construct them, so for example `(a:_)` can be used to get the first element of a list into `a`
  - This can only be done in non empty lists
  - `(x:xs)` patterns must be enclosed by parenthesis to be prioritized

## Lambda Expressions

- Functions can be constructed without being named using lambda expressions
- Lambda expressions are defined in Haskells as follows:

    \x -> x+x

- Lambda expressions can be used to give a formal meaning for functions defined using currying. The `add` function from [Lesson 2](2-types-and-classes.md) can also be defined as:

    add :: Int -> (Int -> Int)
    add :: \x -> (\y -> x + y)

- Lambda expressions can also be used to avoid naming functions which are only meant to be used in one place

## Operator Sections

An operator written between its two arguments can be converted into a curried function written before the two arguments by being enclosed in parentheses

    1+2
    (+) 1 2

Both statements above produce the same result.

This convention also allows for one of the arguments to be included within the parentheses:

    (1+) 2
    (+2) 1

These forms of using operators inside parentheses are called sections.

Sections are useful because they can construct simple but common functions, such as:

- `(1+)`: calculate successor
- `(1/)`: calculate reciprocal
- `(*2)`: calculate double
- `(/2)`: calculate half