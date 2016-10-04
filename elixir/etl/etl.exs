defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    transformed(Map.to_list(input), %{})
  end

  def transformed([h|t], acc) do
    transformed(t , Map.merge(acc, addWord(elem(h,1), elem(h,0), %{})))
  end

  def transformed([], acc) do acc end

  def addWord([h|t], key, acc) do
    addWord(t, key, Map.put_new(acc, String.downcase(h), key))
  end

  def addWord([], _key, acc) do acc end
end
