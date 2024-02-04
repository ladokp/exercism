module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city.slice(0, 4).to_sym.upcase
  end

  def self.get_terminal(ship_identifier)
    cargo = ship_identifier.slice(0, 3).to_sym
    cargo == :OIL || cargo == :GAS ? :A : :B
  end
end
