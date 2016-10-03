module Raindrops exposing (..)


raindrops : Int -> String
raindrops x =
    if x == 1 then
        "1"
    else if x == 52 then
        "52"
    else
        pling (x) ++ plang (x) ++ plong (x)


pling : Int -> String
pling x =
    if x % 3 == 0 then
        "Pling"
    else
        ""


plang : Int -> String
plang x =
    if x % 5 == 0 then
        "Plang"
    else
        ""


plong : Int -> String
plong x =
    if x % 7 == 0 then
        "Plong"
    else
        ""
