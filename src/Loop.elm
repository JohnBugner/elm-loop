module Loop exposing (for, while, whileJust)

{-| Repeatedly apply a function to a value.

# Looping
@docs for, while, whileJust
-}

{-| Repeatedly apply a function to a value `n` times.

    Loop.for 3 ((+) 5) 2 == 17
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

{-| Repeatedly apply a function to a value while the value satisfies the test.

    Loop.while (\ n -> n < 15) ((+) 5) 2 == 17
-}

while : (a -> Bool) -> (a -> a) -> a -> a
while p f v =
    if p v
    then while p f (f v)
    else v

{-| Repeatedly apply a function to a value while the function returns 'Just'.

    f : Int -> Maybe Int
    f n =
        if n < 15
        then Just (n + 5)
        else Nothing

    Loop.whileJust f 2 == 17
-}

whileJust : (a -> Maybe a) -> a -> a
whileJust f v =
    case f v of
        Just v_ -> whileJust f v_
        Nothing -> v
