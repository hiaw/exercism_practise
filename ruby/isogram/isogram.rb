# Write your code for the 'Isogram' exercise in this file. Make the tests in
# `isogram_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/isogram` directory.

class Isogram
  def self.isogram?(input)
    dict = {}
    input.downcase.split(/\W/).join.split('').each do |c|
      return false if dict[c]

      dict[c] = 1
    end
    true
  end
end
