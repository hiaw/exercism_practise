# Write your code for the 'Raindrops' exercise in this file. Make the tests in
# `raindrops_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/raindrops` directory.

class Raindrops
  def self.convert(input)
    output = ''
    output += 'Pling' if input % 3 == 0
    output += 'Plang' if input % 5 == 0
    output += 'Plong' if input % 7 == 0
    output = input.to_s if output == ''
    output
  end
end
