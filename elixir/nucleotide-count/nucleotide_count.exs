defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer

  def count(strand, nucleotide) when nucleotide in @nucleotides do
    counting(strand, nucleotide, 0)
  end

  def count(_, _), do: raise ArgumentError

  def counting([ head | tail ], nucleotide, n) when head in @nucleotides do
    if head == nucleotide do
      counting(tail, nucleotide, n + 1)
    else
      counting(tail, nucleotide, n)
    end
  end

  def counting([], _nucleotide, n), do: n

  def counting(_, _nucleotide, _n), do: raise ArgumentError


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    histogram(@nucleotides, strand, %{})
  end

  def histogram([head| tail], strand, y) do
    histogram(tail, strand, Map.merge(y, %{head =>count(strand, head)}))
  end

  def histogram([], _strand, y) do
    y
  end
end
