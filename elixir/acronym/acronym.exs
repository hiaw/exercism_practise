defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/([A-Z])/, " \\1")
    |> String.split(~r/[ -]/, trim: true)
    |> firstLetter("")
  end

  def firstLetter([head| tail], y) do
    firstLetter(tail, y <> (head |> String.first |> String.upcase))
  end

  def firstLetter([], y) do
    y
  end
end
