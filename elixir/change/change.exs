defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    countCoins(amount, Enum.sort(values, &(&1 > &2)), %{})
  end

  defp countCoins(_amount, [], _acc), do: :error
  defp countCoins(amount, [h], acc) do
    if rem(amount, h) == 0 do
      {:ok, Map.merge(acc, %{h => div(amount, h)})}
    else
      :error
    end
  end

  defp countCoins(amount, [h|t], acc) do
    case (changeable(rem(amount, h), t)) do
      true -> countCoins(rem(amount, h), t, Map.merge(acc, %{h => div(amount, h)}))
      false -> countCoins(amount, t, Map.merge(acc, %{h => 0}))
    end
  end

  defp changeable(amount, []), do: amount == 0
  defp changeable(amount, [h|t]) do
    changeable(rem(amount, h), t)
  end
end
