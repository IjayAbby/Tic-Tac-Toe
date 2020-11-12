# rubocop:disable all

class Player
  attr_reader :name
  attr_accessor :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
  
end
