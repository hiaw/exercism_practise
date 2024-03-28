# Write your code for the 'Clock' exercise in this file. Make the tests in
# `clock_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/clock` directory.
#
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

class Clock
  def initialize(args)
    @hour = args[:hour] || 0
    @minute = args[:minute] || 0
  end

  def to_s
    # @hour %= 24 if @hour < 0
    if @minute >= MINUTES_PER_HOUR
      @hour += (@minute / MINUTES_PER_HOUR).floor
      @minute %= MINUTES_PER_HOUR
    end
    @hour %= HOURS_PER_DAY if @hour >= HOURS_PER_DAY

    "#{format('%02d', @hour)}:#{format('%02d', @minute)}"
  end
end
