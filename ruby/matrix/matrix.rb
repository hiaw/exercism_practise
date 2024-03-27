# Write your code for the 'Matrix' exercise in this file. Make the tests in
# `matrix_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/matrix` directory.

class Matrix
  def initialize(input)
    @rows = input.split("\n").map { |row| row.split.map(&:to_i) }

    num_col = @rows[0].size
    num_row = @rows.size
    @cols = Array.new(num_col) { Array.new(num_row) }
    for col in 0..(num_col - 1)
      for row in 0..(num_row - 1)
        @cols[col][row] = @rows[row][col]
      end
    end
  end

  def row(row_num)
    @rows[row_num - 1]
  end

  def column(col_num)
    @cols[col_num - 1]
  end
end
