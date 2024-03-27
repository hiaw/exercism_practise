module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0, 4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    cargo = ship_identifier.to_s.slice(0, 3)
    return :A if %w[GAS OIL].include?(cargo)

    :B
  end
end
