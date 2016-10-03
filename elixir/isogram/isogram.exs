defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    newS = sentence
    |> (&Regex.replace(~r/[- ]/, &1, "")).()
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
    newS == Enum.uniq(newS)
  end

end
