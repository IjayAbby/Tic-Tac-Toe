# rubocop:disable all

class Board
  attr_accessor :check_box

  def initialize(player_x, player_o)
    @check_box = []
    @player_x = player_x
    @player_o = player_o
  end

  public 

  def empty
    # check if the board is empty or not
    9.times do
      @check_box.push('_')
    end
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

end
