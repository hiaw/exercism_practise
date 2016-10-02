defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> countLetter([])
    |> summeriseLetter
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.trim
    |> String.codepoints
    |> getLetterCount([])
    |> multiplyLetter()
  end

  def getLetterCount([head|tail], acc) do
    if String.match?(head, ~r{\d}) do
      lastValue = List.last(acc)
      if lastValue != nil && is_integer(lastValue) do
        newValue = lastValue * 10 + String.to_integer(head)
        getLetterCount(tail, List.delete_at(acc, -1)++ [newValue])
      else
        getLetterCount(tail, acc ++ [String.to_integer(head)])
      end
    else
      getLetterCount(tail, acc ++ [head])
    end
  end

  def getLetterCount([], acc) do
    acc
  end

  def multiplyLetter(input) do
    fun = fn ([x,y], acc) ->
      acc <> String.duplicate(y, x)
    end
    input
    |> Enum.chunk(2)
    |> Enum.reduce("", fun)
  end

  # encode stuff
  def summeriseLetter(input) do
    fun = fn([key, value], acc) ->
      Integer.to_string(value) <> key <> acc
    end
    Enum.reduce(input, "", fun)
  end

  def countLetter([head|tail], countList) do
    newList =
    if List.last(countList) == nil do
      [[head, 1]] ++ countList
    else
      [key, value] = List.first(countList)
      if key == head do
        [[head, value+1]] ++ List.delete_at(countList, 0)
      else
        [[head, 1]] ++ countList
      end
    end
    countLetter(tail, newList)
  end

  def countLetter([], countList) do
    countList
  end

end
