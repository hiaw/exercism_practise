# Write your code for the 'Tournament' exercise in this file. Make the tests in
# `tournament_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/tournament` directory.

WIN = 'win'.freeze
LOSS = 'loss'.freeze
DRAW = 'draw'.freeze

class Team
  def initialize(name)
    @name = name
    @win = 0
    @draw = 0
    @loss = 0
    @played = 0
  end

  attr_reader :name, :win, :draw, :loss, :played

  def play(score)
    @played += 1
    case score
    when WIN
      @win += 1
    when LOSS
      @loss += 1
    when DRAW
      @draw += 1
    end
  end

  def play_opposite(score)
    case score
    when WIN
      play(LOSS)
    when LOSS
      play(WIN)
    when DRAW
      play(DRAW)
    end
  end

  def points
    @win * 3 + @draw
  end

  def to_s
    title = (@name + ' ' * 30)[0, 31]
    "#{title}|  #{@played} |  #{@win} |  #{@draw} |  #{@loss} |  #{points}\n"
  end

  def ==(other)
    name == other.name
  end

  def self.header
    "Team                           | MP |  W |  D |  L |  P\n"
  end
end

class Tournament
  def self.tally(input)
    teams = {}
    output = Team.header
    unless input.strip.empty?
      input.split("\n").each do |n|
        team_1_name, team_2_name, score = n.strip.split(';')

        teams[team_1_name] = Team.new(team_1_name) unless teams[team_1_name]

        teams[team_1_name].play(score)

        teams[team_2_name] = Team.new(team_2_name) unless teams[team_2_name]

        teams[team_2_name].play_opposite(score)
      end
    end
    teams.each_value do |team|
      output += team.to_s
    end
    output
  end
end
