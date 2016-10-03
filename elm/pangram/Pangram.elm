module Pangram exposing (..)

import String exposing (..)
import Regex exposing (..)
import List.Extra exposing (..)


-- import List exposing (..)


isPangram : String -> Bool
isPangram x =
    "abcdefghijklmnopqrstuvwxyz" == uniqChar (x)


uniqChar : String -> String
uniqChar x =
    x
        |> Regex.replace All (Regex.regex "[ _0-9.\"]") (\_ -> "")
        |> String.toLower
        |> String.toList
        |> List.Extra.unique
        |> List.sort
        |> String.fromList
