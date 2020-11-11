class Player
  attr_reader :name, :symbol

  def initialize
    @@total_player = if !defined?(@@total_player)
                       1
                     else
                       2
                     end

    gett_name
    gett_symbol
  end

  def gett_name
    # Add for the players Name
    if @@total_player == 1
      puts 'Enter Player1 Name'
      @name = gets.chomp.capitalize
    elsif @@total_player == 2
      puts 'Enter Player2 Name'
      @name = gets.chomp.capitalize
    end
  end

  def gett_symbol
    # Add Symbol to each player e.g if player1 = X and player2 = O
    @symbol = @@total_player == 1 ? 'X' : 'O'
  end
end
