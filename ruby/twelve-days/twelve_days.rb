# Write your code for the 'Twelve Days' exercise in this file. Make the tests in
# `twelve_days_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/twelve-days` directory.

ORDER = {
  1 => 'first',
  2 => 'second',
  3 => 'third',
  4 => 'fourth',
  5 => 'fifth',
  6 => 'sixth',
  7 => 'seventh',
  8 => 'eighth',
  9 => 'ninth',
  10 => 'tenth',
  11 => 'eleventh',
  12 => 'twelfth'
}.freeze

PHRASE = {
  1 => 'a Partridge in a Pear Tree',
  2 => 'two Turtle Doves',
  3 => 'three French Hens',
  4 => 'four Calling Birds',
  5 => 'five Gold Rings',
  6 => 'six Geese-a-Laying',
  7 => 'seven Swans-a-Swimming',
  8 => 'eight Maids-a-Milking',
  9 => 'nine Ladies Dancing',
  10 => 'ten Lords-a-Leaping',
  11 => 'eleven Pipers Piping',
  12 => 'twelve Drummers Drumming'
}.freeze

class TwelveDays
  def self.song
    output = ''
    (1..12).each do |i|
      output += 'On the '
      output += ORDER[i]
      output += ' day of Christmas my true love gave to me: '
      if i > 1
        i.downto(2).each do |j|
          output += PHRASE[j]
          output += ', '
        end
      end
      output += 'and ' if i > 1
      output += PHRASE[1]
      output += ".\n"
      output += "\n" if i < 12
    end
    output
  end
end
