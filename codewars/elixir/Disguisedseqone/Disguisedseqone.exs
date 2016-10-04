defmodule Disguisedseqone do

  # def fcn(n) do
  # 	d(5, [2,1])
  # end

  # def d(1, acc) do acc end

  # def d(n, acc) do
  #   [n1 | t] = acc
  #   [n0 | t1] = t

  # 	[(6*n0*n1)/(5*n0-n1) | d(n-1, acc)]
  # end

  def fcn(n) do
  	d(n, 0)
  end

  def d(1, _acc) do 2 end
  def d(0, _acc) do 1 end

  def d(n, _acc) do
    n0 = d(n-2,0)
    n1 = d(n-1,0)

  	(6*n0*n1)/(5*n0-n1)
  end
end
