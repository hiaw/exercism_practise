defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade) do
    existingArray = db[grade]
    if existingArray != nil do
      Map.put(db, grade, existingArray ++ [name])
    else
      Map.put(db, grade, [name])
    end
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    existingArray = db[grade]
    if existingArray == nil do
      []
    else
      existingArray
    end
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    Enum.map(Map.keys(db), fn (x) -> {x, Enum.sort(db[x])} end)
  end
end
