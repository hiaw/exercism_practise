defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    if length(strand1) != length(strand2) do
      {:error, "Lists must be the same length"}
    else
      {:ok, countMatch(strand1, strand2, 0)}
    end
  end

  def countMatch([h1|t1], [h2|t2], acc) do
    if h1 != h2 do
      countMatch(t1, t2, acc + 1)
    else
      countMatch(t1, t2, acc)
    end
  end

  def countMatch([],[], acc) do
    acc
  end
end
