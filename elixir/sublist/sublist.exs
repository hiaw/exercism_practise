defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    if a == b do
      :equal
    else
      sublist(b,a)
    end
  end

  def sublist(a,b) do
    # slice = Enum.slice(a,b)

    index = Enum.find_index(a, fn(x) -> x==List.first(b) end)
    if index == nil do
      if a !== b do
        :unequal
      end
    else
      if index == 0 do
        indexb = Enum.find_index(b, fn(x) -> x==List.first(a) end)
        {h,t} = Enum.split(b,index)
        containAllSublist(t, a)
      else
        {h,t} = Enum.split(a,index)
        containAllSublist(t, b)
      end
      # IO.warn List.to_string(t)
    end
  end

  def containAllSublist([ha| ta],[hb| tb]) do
    if ha == hb do
      containAllSublist(ta, tb)
    end
  end

  def containAllSublist(_,[]) do
    :sublist
  end

  def containAllSublist([],_) do
    :superlist
  end
end
