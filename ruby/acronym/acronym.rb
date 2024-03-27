# Write your code for the 'Acronym' exercise in this file. Make the tests in
# `acronym_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/acronym` directory.

class Acronym
  def self.abbreviate(input)
    input.split(/[ ,-]+/).map { |w| w[0] }.join.upcase
  end
end
