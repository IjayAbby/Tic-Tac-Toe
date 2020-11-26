require './lib/player'

describe Player do
  let(:p1) { Player.new('player1', 'X') }
  let(:p2) { Player.new('player2', 'O') }
  describe '#initialize' do
    it 'returns player1 name' do
      expect(p1.name).to eql('player1')
    end

    it 'returns player1 symbol' do
      expect(p1.symbol).to eql('X')
    end

    it 'returns player2 name' do
      expect(p2.name).to eql('player2')
    end

    it 'returns player2 symbol' do
      expect(p2.symbol).to eql('O')
    end
  end
end
