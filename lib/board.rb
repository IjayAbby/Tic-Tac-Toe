class Board
  def initialize(player_x, player_o)
    @check_box = []
    @player_x = player_x
    @player_o = player_o
  end

  def run_game
    empty
    puts 'Start the Game'
    display_board(@check_box)
    # This method will invoke at the beging of the game from  main class
  end

  def empty
    # check if the board is empty or not
    9.times do
      # It will loop through 9 times to check if board is empty or not
    end
  end

  def start_game(player)
    # Start game and defined players name and symbol
  end

  def play_game(player)
    # continue Playing Game
  end

  def display_board(board)
    # this method will Display the Board
    puts ' ___ ___ ___'
    (0..2).each do |i|
      print "|_#{board[i]}_"
    end
    puts '|'
    (3..5).each do |i|
      print "|_#{board[i]}_"
    end
    puts '|'
    (6..8).each do |i|
      print "|_#{board[i]}_"
    end
    puts '|'
    puts ' '
  end

  def display_number
    # This method will Display the numbers inside the Board.
  end

  def choose_check_box
    # this method will allow players to choose which check_box they want to use as X or O
  end

  def is_check_box_empty?(board)
    # This method will check if the box on the board are empty or not
  end

  def is_check_box_full?
    # This method checks if the box on the board are full or not
  end

  def update_display_board(player, choice)
    # This method will update the display board after each move
  end

  def winner?
    # This method will check for the Winner
  end

  def draw
    # This method will chekc for the Draw when none of the player won the game
  end

  def victory(player)
    # this method will output which player has won the game
  end

  def turn(player)
    # This method will Change player's Turn for next move
  end

  def play_again?
    # this method will invoke after the game is either Draw or one of the player has won the game
  end
end
