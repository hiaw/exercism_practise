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
    hour = args[:hour] || 0
    @minute = args[:minute] || 0
    @minute += hour * MINUTES_PER_HOUR
  end

  attr_accessor :minute

  def to_s
    hour = (@minute / MINUTES_PER_HOUR).floor
    @minute %= MINUTES_PER_HOUR
    hour %= HOURS_PER_DAY

    "#{format('%02d', hour)}:#{format('%02d', @minute)}"
  end

  def +(other)
    Clock.new(minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(minute: @minute - other.minute)
  end

  def ==(other)
    to_s == other.to_s
  end
end
