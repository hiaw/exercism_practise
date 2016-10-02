module Bob exposing (..)
import String exposing (..)

hey: String -> String
hey something =
    if isSilent something then
        "Fine. Be that way!"
    else if isShouting something then
        "Whoa, chill out!"
    else if isQuestion something then
        "Sure."
    else
        "Whatever."

isQuestion: String -> Bool
isQuestion something =
    String.endsWith "?" something

isShouting: String -> Bool
isShouting something =
    String.toUpper something == something && String.toLower something /= something

isSilent: String -> Bool
isSilent something =
    String.trim something == ""
