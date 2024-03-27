# Write your code for the 'Hamming' exercise in this file. Make the tests in
# `hamming_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/hamming` directory.

class Hamming
  def self.compute(a, b)
    raise ArgumentError if a.size != b.size

    (0...a.size).count { |i| a[i] != b[i] }
  end
end
