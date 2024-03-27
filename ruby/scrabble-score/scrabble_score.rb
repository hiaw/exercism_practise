# Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
# `scrabble_score_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/scrabble-score` directory.

ALPHABET_SCORE =
  Hash[['AEIOULNRST'.split('').map { |c| [c, 1] },
        'DG'.split('').map { |c| [c, 2] },
        'BCMP'.split('').map { |c| [c, 3] },
        'FHVWY'.split('').map { |c| [c, 4] },
        'K'.split('').map { |c| [c, 5] },
        'JX'.split('').map { |c| [c, 8] },
        'QZ'.split('').map { |c| [c, 10] }].flatten(1)].freeze

class Scrabble
  def initialize(input)
    @input = input
  end

  def score
    @input.upcase.split('').sum { |c| ALPHABET_SCORE[c] }
  end
end
