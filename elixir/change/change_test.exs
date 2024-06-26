if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("change.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule ChangeTest do
  use ExUnit.Case

  test "returns :error on empty list" do
    assert Change.generate(1, []) == :error
  end

  # @tag :skip
  test "generates the correct change when only one coin type is needed" do
    change = %{1 => 5, 10 => 0}
    assert Change.generate(5, [1, 10]) == {:ok, change}
  end

  # @tag :skip
  test "generates the correct change when multiple coin types are needed" do
    change = %{1 => 3, 5 => 1, 10 => 1}
    assert Change.generate(18, [1, 5, 10]) == {:ok, change}
  end

  # @tag :skip
  test "returns :error when it is not possible to generate change" do
    assert Change.generate(3, [5, 10, 25]) == :error
  end

  # @tag :skip
  test "generates change using only small coins when it is not possible to combine them with larger coins" do
    change = %{3 => 34, 100 => 0}
    assert Change.generate(102, [3, 100]) == {:ok, change}
  end

  test "another test for unique changable" do
    change = %{3 => 0, 7 => 7, 9 => 0, 11 => 0, 100 => 0}
    assert Change.generate(49, [3, 7, 9, 11, 100]) == {:ok, change}
  end

  # @tag :skip
  test "generates the same change given any coin order" do
    change = %{1 => 3, 5 => 1, 10 => 1}
    assert Change.generate(18, [1, 5, 10]) == {:ok, change}
    assert Change.generate(18, [10, 5, 1]) == {:ok, change}
  end

  # @tag :skip
  test "generates the correct change for large values with many coins" do
    change = %{1 => 3, 5 => 1, 10 => 0, 25 => 1, 100 => 1}
    assert Change.generate(133, [1, 5, 10, 25, 100]) == {:ok, change}
  end
end
