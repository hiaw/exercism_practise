# Write your code for the 'Luhn' exercise in this file. Make the tests in
# `luhn_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/luhn` directory.

class Luhn
  def self.valid?(input)
    digits = input.delete('^0-9')
    return false if digits.length == 1

    has_other_char = input.match(/[^0-9 ]/)
    return false unless has_other_char.nil?

    all_digits = digits.split('').reverse.map.with_index do |val, i|
      value = val.to_i
      value *= 2 if i.odd?
      value -= 9 if value > 9

      value
    end
    total = all_digits.sum
    (total % 10).zero?
  end
end
