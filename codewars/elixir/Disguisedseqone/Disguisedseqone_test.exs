Code.load_file("Disguisedseqone.exs", __DIR__)

ExUnit.start
ExUnit.configure trace: true

defmodule DisguisedseqoneTest do
  alias Disguisedseqone, as: D

  use ExUnit.Case

  test "17" do
    assert D.fcn(17) == 131072
  end
  test "21" do
    assert D.fcn(21) == 2097152
  end
  test "14" do
    assert D.fcn(14) == 16384
  end
  test "19" do
    assert D.fcn(19) == 524288
  end
  test "32" do
    assert D.fcn(32) == 4294967296
  end
  # test "43" do
  #   assert D.fcn(43) == 8796093022208
  # end

  # defp testing(numtest, num, ans) do
  #   IO.puts("Test #{numtest}")
  #   assert Disguisedseqone.fcn(num) == ans
  # end
  # test "nb_dig" do
  #   testing(1, 17, 131072)
  #   testing(2, 21, 2097152)
  #   testing(3, 14, 16384)
  #   # testing(4, 43, 8796093022208)
  #   testing(5, 19, 524288)
  # end
end
