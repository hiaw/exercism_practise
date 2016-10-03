defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(n) do
    cond do
      n == 1 ->
        "No more bottles of beer on the wall, no more bottles of beer.\n" <>
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      n == 2 ->
        Integer.to_string(n-1) <> " bottle of beer on the wall, " <> Integer.to_string(n-1) <>
          " bottle of beer.\nTake it down and pass it around, "<> "no more"<>
          " bottles of beer on the wall.\n"
      n == 3 ->
        Integer.to_string(n-1) <> " bottles of beer on the wall, " <> Integer.to_string(n-1) <>
          " bottles of beer.\nTake one down and pass it around, "<> Integer.to_string(n-2) <>
          " bottle of beer on the wall.\n"
      true ->
        Integer.to_string(n-1) <> " bottles of beer on the wall, " <> Integer.to_string(n-1) <>
          " bottles of beer.\nTake one down and pass it around, "<> Integer.to_string(n-2) <>
          " bottles of beer on the wall.\n"
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range) do
    returnString = Enum.reduce(range, "", fn (i, acc) -> acc <> verse(i) <> "\n" end)
    String.slice(returnString, 0..-2)
  end

  def lyrics() do
    lyrics(100..1)
  end
end
