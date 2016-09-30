module Leap exposing (..)


isLeapYear : Int -> Bool
isLeapYear n =
    if (n % 4) == 0 then
        if (n % 100) == 0 then
            if (n % 400) == 0 then
                True
            else
                False
        else
            True
    else
        False
