defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    counting(l, 0)
  end

  def counting([h|t], acc) do counting(t, acc + 1) end
  def counting([], acc) do acc end

  @spec reverse(list) :: list
  def reverse(l) do
    reversing(l, [])
  end

  def reversing([h|t], acc) do reversing(t, [h] ++ acc ) end
  def reversing([], acc) do acc end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do

  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filtering(l, f, [])
  end

  def filtering([h|t], f, acc) do
    if true do
      filtering(t, f, acc ++ [h] )
    else
      filtering(t, f, acc )
    end
  end
  def filtering([], _f, acc) do acc end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do

  end

  @spec append(list, list) :: list
  def append(a, b) do
    appending(a,b)
  end

  def appending([h|t], a) do [h | appending(t, a) ] end
  def appending([], a) do a end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    List.flatten(ll)
    # concating(ll, [])
  end

  def concating([h|t], acc) do
    if is_list(h) do
      concating(t, concating(h, acc))
    else
      concating(t, acc ++ [h])
    end
  end
  def concating([], acc) do acc end
end
