# rubocop:disable all

class Board
  def initialize(player_x, player_o)
    @check_box = []
    @player_x = player_x
    @player_o = player_o
  end

  def run_game
    # This method will invoke at the beging of the game from  main class
    empty
    puts 'Who would like to begin?'
    player = gets.chomp.capitalize
    while player.empty? || (player != @player_x.name && player != @player_o.name)
      puts 'Not Correct Name or Name is empty Please Write Correct Name and Try Again! '
      player = gets.chomp.capitalize
    end
    player == @player_x.name ? start_game(@player_x) : start_game(@player_o)
  end

  def empty
    # check if the board is empty or not
    9.times do
      @check_box.push('_')
    end
  end

  def start_game(player)
    # Start game and defined players name and symbol
    puts "\n#{player.name} starts! \n"
    display_number
    choice = choose_check_box
    update_display_board(player, choice)
    display_board(@check_box)
    turn(player)
  end

  def play_game(player)
    # continue Playing Game
    puts "\nIt's your turn, #{player.name}! \n"
    choice = choose_check_box
    update_display_board(player, choice)
    display_board(@check_box)
    turn(player)
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
    puts 'Here are your choices:'
    @check_box_number = @check_box.each_with_index.map do |value, indx|
      if value == '_'
        (indx + 1).to_s
      else
        '_'
      end
    end
    display_board(@check_box_number)
  end

  def choose_check_box
    # this method will allow players to choose which check_box they want to use as X or O
    puts "Enter your choice Number (1-9)"
    choice = gets.chomp
    # display_number
    choice = choice.to_i
    @check_box.each do |_i|
      while !choice.to_i.between?(1, 9) || !check_box_empty?(choice)
        puts "That's not a Valid Number! or Cell is Empty \n"
        puts "Enter a Number between (1-9):"
        choice = gets.chomp.to_i
      end
    end
    choice
  end

  def check_box_empty?(cell)
    # This method will check if the box on the board are empty or not
    @check_box[cell - 1] == '_'
  end

  def check_box_full?
    # This method checks if the box on the board are full or not
    @check_box.all? { |i| i != '_' }
  end

  def update_display_board(player, choice)
    # This method will update the display board after each move
    @check_box[choice - 1] = player.symbol
  end

  def winner?
    # This method will check for the Winner
    win_move = false
    @row = [
      [@check_box[0], @check_box[1], @check_box[2]],
      [@check_box[3], @check_box[4], @check_box[5]],
      [@check_box[6], @check_box[7], @check_box[8]],
      [@check_box[0], @check_box[3], @check_box[6]],
      [@check_box[1], @check_box[4], @check_box[7]],
      [@check_box[2], @check_box[5], @check_box[8]],
      [@check_box[0], @check_box[4], @check_box[8]],
      [@check_box[6], @check_box[4], @check_box[2]],
    ]
    @row.each do |row|
      if row.all? { |i| i == 'O' }
        win_move = true
        break
      elsif row.all? { |i| i == 'X' }
        win_move = true
        break
      else
        win_move = false
      end
    end
    win_move
  end

  def draw
    # This method will chekc for the Draw when none of the player won the game
    puts 'The board is full, and No one won!, It\'s a Tie'
    play_again?
  end

  def victory(player)
    # this method will output which player has won the game
    puts "The winner is #{player.name}. Congratulations!"
    play_again?
  end

  def turn(player)
    # This method will Change player's Turn for next move
    # player.odd? ? 'player_x' : 'player_o'
    victory(player) if winner?
    draw if check_box_full?
    player == @player_x ? play_game(@player_o) : play_game(@player_x)
  end

  def quit_game
    quit = ''
    puts 'Do you want to Exit the Game? (Y/N)'
      while quit != 'Y' || quit != 'N'
        quit = gets.chomp.upcase
        if quit == 'Y'
          abort
        else
          play_again?
        end
      end
  end

  def play_again?
    # this method will invoke after the game is either Draw or one of the player has won the game
    puts 'Do you want to Play Again? (Y/N)'
    response = ''
    # quit = ''
    while response != 'Y' || response != 'N'
      response = gets.chomp.upcase
      if response == 'Y'
        board = Board.new(@player_x, @player_o)
        board.run_game
      elsif response == 'N'
        quit_game
      else
        puts 'Please Enter (Y/N)'
      end
    end
  end
end
