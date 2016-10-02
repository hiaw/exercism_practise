defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.trim
    |> String.upcase
    |> String.codepoints
    |> countPoint(0)
  end

  def countPoint([h|t], acc) do
    cond do
      String.match?(h,~r{[AEIOULNRST]}) -> countPoint(t, acc + 1)
      String.match?(h,~r{[DG]}) -> countPoint(t, acc + 2)
      String.match?(h,~r{[BCMP]}) -> countPoint(t, acc + 3)
      String.match?(h,~r{[FHVWY]}) -> countPoint(t, acc + 4)
      String.match?(h,~r{[K]}) -> countPoint(t, acc + 5)
      String.match?(h,~r{[JX]}) -> countPoint(t, acc + 8)
      String.match?(h,~r{[QZ]}) -> countPoint(t, acc + 10)
    end
  end

  def countPoint([], acc) do
    acc
  end
end
