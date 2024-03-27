# Write your code for the 'Word Count' exercise in this file. Make the tests in
# `word_count_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/word-count` directory.

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    output = {}
    @phrase.downcase.split(/[^A-Za-z0-9']/).map do |word|
      word = word[1..] if word[0] == "'"
      word = word[..-2] if word[-1] == "'"

      next unless word != ''

      if output[word]
        output[word] += 1
      else
        output[word] = 1
      end
    end
    output
  end
end
