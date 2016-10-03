defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(n) do
    combineNumber(splitToParts(n, []), "")
  end

  def splitToParts(0, acc) do
    acc
  end

  def splitToParts(n, acc) do
    cond do
      div(n, 1000) > 0 ->
        splitToParts(n - 1000, acc ++ [1000])
      div(n, 900) > 0 ->
        splitToParts(n - 900, acc ++ [100, 1000])
      div(n, 600) > 0 ->
        splitToParts(n - 600, acc ++ [500, 100])
      div(n, 500) > 0 ->
        splitToParts(n - 500, acc ++ [500])
      div(n, 400) > 0 ->
        splitToParts(n - 400, acc ++ [100, 500])
      div(n, 100) > 0 ->
        splitToParts(n - 100, acc ++ [100])
      div(n, 90) > 0 ->
        splitToParts(n - 90, acc ++ [10, 100])
      div(n, 60) > 0 ->
        splitToParts(n - 60, acc ++ [50, 10])
      div(n, 50) > 0 ->
        splitToParts(n - 50, acc ++ [50])
      div(n, 40) > 0 ->
        splitToParts(n - 40, acc ++ [10, 50])
      div(n, 10) > 0 ->
        splitToParts(n - 10, acc ++ [10])
      div(n, 9) > 0 ->
        splitToParts(n - 9, acc ++ [1, 10])
      div(n, 6) > 0 ->
        splitToParts(n - 6, acc ++ [5, 1])
      div(n, 5) > 0 ->
        splitToParts(n - 5, acc ++ [5])
      div(n, 4) > 0 ->
        splitToParts(n - 4, acc ++ [1, 5])
      div(n, 1) > 0 ->
        splitToParts(n - 1, acc ++ [1])
      true ->
        splitToParts(0, acc ++ [n])
    end
  end

  def combineNumber([h|t], acc) do
    combineNumber(t, acc <> singleDigit(h))
  end

  def combineNumber([], acc) do
    acc
  end

  def singleDigit(n) do
    cond do
      n == 1 -> "I"
      n == 5 -> "V"
      n == 10 -> "X"
      n == 50 -> "L"
      n == 100 -> "C"
      n == 500 -> "D"
      n == 1000 -> "M"
    end
  end
end
