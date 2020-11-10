class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def run_game
    empty
    puts 'Start the Game'
    display_number
    # This method will invoke at the beging of the game from  main class
  end

  def empty
    # check if the board is empty or not
    nil
  end

  def start_game(_player)
    # Start game and defined players name and symbol
    nil
  end

  def play_game(_player)
    # continue Playing Game
    nil
  end

  def display_board(_board)
    # this method will Display the Board
    nil
  end

  def display_number
    # This method will Display the numbers inside the Board.
    puts ' ___ ___ ___'
    puts '|_1_ _2_ _3_|'
    puts '|_4_ _5_ _6_|'
    puts '|_7_ _8_ _9_|'
    puts '|___ ___ ___|'
  end

  def choose_check_box
    # this method will allow players to choose which check_box they want to use as X or O
    nil
  end

  def check_box_empty?(_boardd)
    # This method will check if the box on the board are empty or not
    nil
  end

  def check_box_full?(_postion)
    # This method checks if the box on the board are full or not
    nil
  end

  def update_display_board(_player, _choice)
    # This method will update the display board after each move
    nil
  end

  def winner?
    # This method will check for the Winner
    nil
  end

  def draw
    # This method will chekc for the Draw when none of the player won the game
    nil
  end

  def victory(_player)
    # this method will output which player has won the game
    nil
  end

  def turn(player)
    # This method will Change player's Turn for next move
    player.odd? ? 'player_x' : 'player_o'
  end

  def play_again?
    # this method will invoke after the game is either Draw or one of the player has won the game
    nil
  end
end
