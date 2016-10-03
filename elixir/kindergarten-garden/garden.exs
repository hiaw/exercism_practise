defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """
  @spec info(String.t(), list) :: map
  def info(info_string, student_names) do
    [top, bottom] = String.split(info_string)
    topc = Enum.chunk(String.codepoints(top), 2)
    bottomc = Enum.chunk(String.codepoints(bottom), 2)
    zip_array = List.zip([topc, bottomc])
    new_array = getPlants(zip_array, [])

    map_it(Enum.sort(student_names), new_array, %{})
  end

  def info(info_string) do
    children = [:alice, :bob, :charlie, :david,
                :eve, :fred, :ginny, :harriet,
                :ileana, :joseph, :kincaid, :larry]
    info(info_string, children)
  end

  def map_it([h|t], [h1|t1], acc) do
    map_it(t,t1,Map.put(acc, h, h1))
  end
  def map_it([h|t], [], acc) do
    map_it(t,[],Map.put(acc, h, {}))
  end
  def map_it([], _, acc) do acc end

  def getPlants([h|t], acc) do
    getPlants(t, acc ++ [getInPlants(List.flatten(Tuple.to_list(h)), {})])
  end
  def getPlants([], acc) do acc end

  def getInPlants([h|t], acc) do
    getInPlants(t, Tuple.append(acc, plantName(h)))
  end
  def getInPlants([], acc) do acc end

  def plantName(s) do
    cond do
      s == "G" -> :grass
      s == "C" -> :clover
      s == "R" -> :radishes
      s == "V" -> :violets
    end
  end
end
