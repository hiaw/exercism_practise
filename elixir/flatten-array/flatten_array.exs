defmodule FlattenArray do
  @doc """
  Accept a list and return the list flattened without nil values.

  ## Examples

  iex> FlattenArray.flatten([1, [2], 3, nil])
  [1,2,3]

  iex> FlattenArray.flatten([nil, nil])
  []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    Enum.reverse(flattening([], list))
  end

  def flattening(acc, [h|t]) do
    if is_list(h) do
      flattening(acc, h)
      |> flattening(t)
    else
      if h==nil do
        flattening(acc, t)
      else
        [h | acc]
        |> flattening(t)
      end
    end
  end

  def flattening(acc, []) do
    acc
  end
end
