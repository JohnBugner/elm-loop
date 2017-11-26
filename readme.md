# elm-loop

These functions are for looping, like the `while` and `for` statements in imperative languages. Don't use these if you can use `map`, `foldl`, or `foldr` instead. Use them only when you need to repeatedly apply a function to a value. Another way of thinking about these functions is that they let you write a recursive function without having to write the recursive part yourself; You have to provide only the predicate function (or the number of times to recurse), the update function, and the initial value.
