# Write your code for the 'Series' exercise in this file. Make the tests in
# `series_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/series` directory.

class Series
  def initialize(input)
    @input = input
  end

  def slices(slice_num)
    raise ArgumentError if slice_num > @input.size
    raise ArgumentError if slice_num <= 0

    output = []
    for i in 0..(@input.size - slice_num)
      output.push @input[i..(i + slice_num - 1)]
    end
    output
  end
end
