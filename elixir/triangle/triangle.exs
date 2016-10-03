defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) do
    cond do
      nonPositiveValues(a,b,c) -> { :error, "all side lengths must be positive" }
      inequalTriangle(a,b,c) -> { :error, "side lengths violate triangle inequality" }
      threeEqual(a,b,c) -> {:ok, :equilateral}
      twoEqual(a,b,c) -> {:ok, :isosceles}
      true -> {:ok, :scalene}
    end
  end

  def nonPositiveValues(a,b,c) do
    a <= 0 || b <= 0 || c <= 0
  end

  def inequalTriangle(a,b,c) do
    a >= b + c || b >= a + c || c >= a + b
  end

  def threeEqual(a,b,c) do
    a == b && b == c
  end

  def twoEqual(a,b,c) do
    a == b || b == c || a == c
  end

end
