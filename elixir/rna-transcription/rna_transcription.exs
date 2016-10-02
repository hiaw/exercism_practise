defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    newDNA = dna |> String.Chars.to_string |> String.codepoints
    accRNA(newDNA, "")
  end

  def getMatchingRNA(i) do
    cond do
      i == "G" -> "C"
      i == "C" -> "G"
      i == "T" -> "A"
      i == "A" -> "U"
    end
  end

  def accRNA([h|t], acc) do
    accRNA(t, acc <> getMatchingRNA(h))
  end

  def accRNA([], acc) do
    String.to_charlist(acc)
  end
end
