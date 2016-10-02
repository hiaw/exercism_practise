defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    stringMatch(base, candidates, [])
  end

  def stringMatch(base, [h|t], acc) do
    baseMatch = base |> String.downcase |> String.codepoints |> Enum.sort
    hMatch = h |> String.downcase |> String.codepoints |> Enum.sort
    if (hMatch == baseMatch && String.downcase(h) != String.downcase(base)) do
      stringMatch(base, t, acc ++ [h])
    else
      stringMatch(base, t, acc)
    end
  end

  def stringMatch(_base, [], acc) do
    acc
  end
end
