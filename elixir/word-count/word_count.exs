defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/[:_ !&@$%^,]/, trim: true)
    |> counting(%{})
  end

  def counting([ head | tail], y) do
    counting(tail, mergeMap( head, tail , y ))
  end

  def counting([], y) do
    y
  end

  def mergeMap( head, tail , y ) do
    Map.merge(y, headMap( head, tail, y ))
  end

  def headMap( head, tail, y ) do
    %{head => countMap(Map.keys(y), head, keyValue(y,head))}
  end

  def keyValue( y, head ) do
    if Map.has_key?(y, head) do
      y[head]
    else
      1
    end
  end

  def countMap([head|tail], y, n) do
    if head == y do
      countMap(tail, y, n+1)
    else
      countMap(tail, y, n)
    end
  end

  def countMap([], _y, n) do
    n
  end
end
