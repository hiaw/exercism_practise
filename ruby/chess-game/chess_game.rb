module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    return false unless RANKS.include? rank
    return false unless FILES.include? file

    true
  end

  def self.nick_name(first_name, last_name)
    "#{first_name[..1]}#{last_name[-2..]}".upcase
  end

  def self.move_message(first_name, last_name, square)
    rank = square[1].to_i
    file = square[0]
    name = Chess.nick_name(first_name, last_name)
    if Chess.valid_square?(rank, file)
      "#{name} moved to #{square}"
    else
      "#{name} attempted to move to #{square}, but that is not a valid square"
    end
  end
end
