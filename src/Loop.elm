module Loop exposing (while, until)

{-| Repeatedly apply a function to a value while or until a predicate holds.

# Looping
@docs while, until
-}

{-| Repeatedly apply a function to a value *while* a predicate holds.

    while (\ n -> n < 10) ((+) 5) 2 == 12
-}
while : (a -> Bool) -> (a -> a) -> a -> a
while p f v =
    if p v
    then while p f (f v)
    else v

{-| Repeatedly apply a function to a value *until* a predicate holds.

    until (\ n -> n > 10) ((+) 5) 2 == 12
-}
until : (a -> Bool) -> (a -> a) -> a -> a
until p = while (not << p)
