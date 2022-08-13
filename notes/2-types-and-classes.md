# Types & Classes

## What is a type?

- Pretty much a collection of related values
- A good use of types is to specify what a function expects and throw a type error if a function receives a weird input

## Types in Haskell

    e :: t

The above means `e` is of type `t`.

- Every well formed expression has a type which can be calculated at compile time using type inference
- Though this is useful, it's a good practice to keep types explicit
- Haskell is strongly typed, which makes programs safer and faster
- To evaluate a type of an expression in GHCi, use `:type`

### Basic Types

- `Bool`
- `Char`
  - Single characters enclosed in 'single quotes'
- `String`
  - Sequences of characters enclosed in "double quotes"
- `Int`
- `Float`

## Forming New Types

### [Lists]

- A list is a sequence of values of the *same* type
- A list is not a type in and of itself, for example a list of `Char`s is evaluated as a `[Char]`, which for all intents and purposes also behaves like a `Char`
  - This results in the possibility of making lists of lists
- The type of a list doesn't give any information about the list's size

### (Tuples)

- The same thing as lists, but can store values of different types
- The type of a tuple also restricts how many elements it has

### Functions

- A function is a mapping of values from one type to another (not necessarily different) type
- They behave like mathematical functions, so they accept multiple inputs and can return multiple outputs
  - For normal functions to receive multiple parameters, they need to be enclosed in a list or tuple

    f :: t1 -> t2

#### Curried Functions

You can return functions as results of functions.

    add' :: Int -> (Int -> Int)
    add' x y = x+y

The above example shows how to make an addition function which receives multiple parameters. Sort of taking it one parameter at a time. You can think of it being executed as `(add' x) y`. This produces the same result as `add (x,y)`

- Curried functions are useful because, since they take their parameters one at a time, they can be applied partially and do interesting things.

#### Currying Conventions

In the case of curried functions...

1. An arrow (->) always associates to the right
   
       Int -> Int -> Int -> Int
       means the same as...
       Int -> (Int -> (Int -> Int))

2. Because of 1. all function applications are associated to the left

Unless tupling is explicity required, all functions in haskell are normally defined in curried form

#### Polymorphic Functions

Polymorphic functions can work on multiple types by being defined using a type variable.

    length :: [a] -> Int

In this case we know the `length` function takes a list as a parameter, but the `a` type variable says it doesn't matter what the list is composed of (`a` is just a placeholder name)

- Type variables must begin with a lowercase letter are usually named a, b, c, etc...

#### Overloaded Functions

These are polymorphic functions which have type variables that have class constraints

    (+) :: Num a => a -> a -> a

The fat arrow (=>) essentially means "for any numeric type a"

##### Type Classes

- `Num` are numeric types
- `Eq` are equality types (things that can be equal to another thing)
- `Ord` are ordered types (things that can have an order)

## Tips

- When defining a new function in Haskell, it is helpful to start by its type
- It's good practice to state the type of every function defined
- When stating the types of polymorphic functions that use numbers, equality or orderings, include necessary class constraints