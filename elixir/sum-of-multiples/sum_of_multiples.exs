defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    list = Enum.map(factors, fn(x) -> allFactorUnderLimit(limit, 0, x, []) end)
    newList = list |> List.flatten |> Enum.uniq
    Enum.reduce(newList, 0, fn(x, acc) -> x + acc end)
  end

  def allFactorUnderLimit(0, 0, 0, acc) do
    acc
  end

  def allFactorUnderLimit(limit, value, base, acc) do
    newValue = value + base
    if limit > newValue do
      allFactorUnderLimit(limit, newValue, base, acc ++ [newValue])
    else
      allFactorUnderLimit(0, 0, 0, acc)
    end
  end

end
