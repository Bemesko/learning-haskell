# Lesson 7 - How to Think Recursively

I personally recommend you just go and watch the corresponding video for these notes: https://youtu.be/n6bg8L91Qew?list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3

## Refreshers

1. What are recursive functions?
   - Functions defined in terms of themselves (self-referential)
2. Why are they useful?
   - In a language like Haskell, recursion is the only way of doing loop operations
   - Also you get the advantage of using mathematical induction
3. Why are they difficult at first?
   - It's a different way of thinking, since most people are used to imperative, state-based programming
   - Only a matter of practice to get used to it.

## 7 Step Process to Recursion

1. Name the function
   - In functional languages, function names are very concise since functions can be very general
2. Write down the types for the function
   - Write a simple type first of all, generalize the types later
3. Enumerate the cases
   - Also known as writing down the skeleton
   - For any kind of input type there are some standard patterns for recursion
   - The default cases might not be the right ones to use, but start with the simple and only refine later if necessary
4. Define the simple cases
   - Usually they're the base cases but not always
   - Just look at a case and if you can think of the result quickly it's a simple case
5. List the "ingredients"
   - Before writing the recursive cases, remind yourself of what operations you can use (taking into considerations the types, for example)
6. Define the other cases
   - This is the most difficult part
   - Try out simpler parts of recursion first
7. Think about the result
   - Think if things can be generalized (especially the type)
   - Think if the definition can be simplified