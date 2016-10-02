defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    newString = str |> String.codepoints
    check_brackets_array(newString, []) == []
  end

  def matchLastBracket(open, close) do
    cond do
      open == "{" && close == "}" -> true
      open == "[" && close == "]" -> true
      open == "(" && close == ")" -> true
      true -> false
    end
  end

  def check_brackets_array([h|t], acc) do
    last_bracket = List.last(acc)
    if String.match?(h, ~r/[\w\s]/) do
      check_brackets_array(t, acc)
    else
      if last_bracket != nil do
        if matchLastBracket(last_bracket, h) do
          check_brackets_array(t, List.delete_at(acc, -1))
        else
          check_brackets_array(t, acc ++ [h])
        end
      else
        check_brackets_array(t, acc ++ [h])
      end
    end

  end

  def check_brackets_array([], acc) do
    acc
  end
end
