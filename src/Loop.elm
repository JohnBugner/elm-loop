module Loop exposing (while, for)

{-| Repeatedly apply a function to a value.

# Looping
@docs while, for
-}

{-| Repeatedly apply a function to a value *while* a predicate holds.

    while (\ n -> n < 10) ((+) 5) 2 == 12
-}
while : (a -> Bool) -> (a -> a) -> a -> a
while p f v =
    if p v
    then while p f (f v)
    else v

{-| Repeatedly apply a function to a value `n` times.

    for 3 ((+) 5) 2 == 17
-}
for : Int -> (a -> a) -> a -> a
for =
    let
        for_ : Int -> Int -> (a -> a) -> a -> a
        for_ i n f v =
            if i < n
            then for_ (i + 1) n f (f v)
            else v
    in
        for_ 0
