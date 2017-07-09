module Loop exposing (while, until)

while : (a -> Bool) -> (a -> a) -> a -> a
while p u s =
    if p s
    then while p u (u s)
    else s

until : (a -> Bool) -> (a -> a) -> a -> a
until p = while (not << p)
