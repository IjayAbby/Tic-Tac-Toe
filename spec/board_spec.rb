require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
  let(:player1) { Player.new('p1', 'X') }
  let(:player2) { Player.new('p2', 'O') }
  let(:board) { Board.new(player1, player2) }
  let(:check_box) { [] }
  let(:board_full) { %w[X O X O X O O X O] }
  let(:board_not_full) { %w[X O _ O X _ O X _] }
  let(:player1_win) { %w[X X X O O _ _ _ _] }
  let(:player2_win) { %w[X X _ O O O _ _ _] }

  describe '#initialize' do
    it 'should check for player1' do
      expect(board.player_x).to eql(player1)
    end

    it 'should check for player2' do
      expect(board.player_o).to eql(player2)
    end

    it 'should check if check box is an empty array' do
      expect(board.check_box).to eql(check_box)
    end

    it 'should check if check box is not an empty array' do
      expect(check_box { [4] }).to eql(check_box { [5] })
    end
  end

  describe '#empty' do
    it 'should check if board is empty' do
      board.empty
      expect(board.check_box).to eql((1..9).collect { '_' })
    end
  end

  describe '#check_box_empty?' do
    describe 'should check when check box is empty' do
      it 'return false' do
        expect(board.check_box_empty?(5)).to eql(false)
      end
    end

    describe 'should return true if there is no position picked' do
      before { board.empty }
      it 'should return true if no choice is given' do
        expect(board.check_box_empty?(5)).to eql(true)
      end

      it 'should return false if there is a position picked' do
        board.check_box[3] = 'O'
        expect(board.check_box_empty?(4)).to eql(false)
      end
    end
  end

  describe '#check_box_full?' do
    it 'return false if board is empty' do
      expect(board.check_box_full?).to eql(false)
    end

    it 'should return true if board is full' do
      expect(board_full).to eql(board_full)
    end

    it 'should return false if board has any empty cell' do
      board.check_box = board_not_full
      expect(board.check_box_full?).to eql(false)
    end

    it 'should return false if all cells are empty' do
      expect(check_box.all?).to eql(check_box.all? { |i| i != '_' })
    end
  end

  describe '#update_display_board' do
    before do
      board.empty
      @player_choice = board.update_display_board(player, choice)
    end

    describe 'when player choice is between the range of 1-9' do
      let(:choice) { 4 }
      let(:player) { player1 }

      it 'should return player symbol' do
        expect(board.check_box[choice - 1]).to eql(player.symbol)
      end
    end

    describe 'when choice of player is not between the range of 1-9' do
      let(:choice) { 10 }
      let(:player) { player1 }
      it 'returns nil' do
        expect(board.check_box[choice - 1]).to eql(nil)
      end
    end

    describe 'when a player inputs a string as a choice' do
      let(:choice) { 'me' }
      let(:player) { player2 }
      it 'return should return false' do
        expect(@player_choice).to eql(false)
      end
    end

    describe 'when a player choice is a float' do
      let(:choice) { 6.8 }
      let(:player) { player2 }
      it 'return the player symbol and update the check_box' do
        expect(@player_choice).to eql(player.symbol)
      end
    end

    describe 'when a player choice is a not float' do
      let(:choice) { 6 }
      let(:player) { player2 }
      it 'return the player symbol and update the check_box' do
        expect(@player_choice).to eql(player.symbol)
      end
    end
  end

  describe '#winner?' do
    before { board.empty }
    describe 'when player1 is the winner' do
      it 'returns true' do
        board.check_box = player1_win
        expect(board.winner?).to eql(true)
      end
    end

    describe 'when player2 is the winner' do
      it 'returns true' do
        board.check_box = player2_win
        expect(board.winner?).to eql(true)
      end
    end

    describe 'when draw' do
      it 'return false' do
        board.check_box = board_full
        expect(board.winner?).to eql(false)
      end
    end

    describe 'when next move is winning' do
      it 'return true' do
        board.check_box = board_not_full
        board.check_box[8] = 'X'

        expect(board.winner?).to eql(true)
      end
    end
  end
end
