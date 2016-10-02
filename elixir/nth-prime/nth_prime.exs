defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) do
    if count == 0, do: raise "can't do 0"
    List.last(prime(count))
  end

  def prime(count), do: prime(0, count, 2)

  def prime(count, count, acc), do: []

  def prime(n, count, acc) do
    # IO.warn n
    case is_prime(acc) do
      true -> [acc | prime(n+1, count, acc + 1)]
      false -> prime(n, count, acc + 1)
    end
  end

  def is_prime(x) do
    sum_acc = Enum.filter(2..x, fn (a) -> rem(x,a) == 0 end)
    length(sum_acc)== 1
  end

end
