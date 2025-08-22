require 'spec_helper'

describe Board do
  describe '#initialize' do
    let(:board) { Board.new }
    
    it 'creates a 6x7 grid' do
      expect(board.grid.size).to eq(6)
      expect(board.grid.all? { |row| row.size == 7 }).to be true
    end

    it 'initializes with empty cells' do
      expect(board.grid.flatten.all? { |cell| cell.nil? }).to be true
    end
  end

  describe '#drop_piece' do
    let(:board) { Board.new }

    it 'places a piece in the specified column' do
      board.drop_piece(0, '🔴')
      expect(board.grid[5][0]).to eq('🔴')
    end

    it 'stacks pieces in the same column' do
      board.drop_piece(0, '🔴')
      board.drop_piece(0, '🟡')
      expect(board.grid[5][0]).to eq('🔴')
      expect(board.grid[4][0]).to eq('🟡')
    end

    it 'returns false if column is full' do
      6.times { board.drop_piece(0, '🔴') }
      expect(board.drop_piece(0, '🟡')).to be false
    end

    it 'returns false for invalid column' do
      expect(board.drop_piece(-1, '🔴')).to be false
      expect(board.drop_piece(7, '🔴')).to be false
    end
  end

  describe '#full?' do
    let(:board) { Board.new }

    it 'returns false for empty board' do
      expect(board.full?).to be false
    end

    it 'returns true for full board' do
      7.times do |col|
        6.times { board.drop_piece(col, '🔴') }
      end
      expect(board.full?).to be true
    end
  end

  describe '#winner?' do
    let(:board) { Board.new }

    it 'detects horizontal win' do
      4.times { |col| board.drop_piece(col, '🔴') }
      expect(board.winner?('🔴')).to be true
    end

    it 'detects vertical win' do
      4.times { board.drop_piece(0, '🔴') }
      expect(board.winner?('🔴')).to be true
    end

    it 'detects diagonal win' do
      # Setup diagonal pattern
      board.drop_piece(0, '🔴')
      
      board.drop_piece(1, '🟡')
      board.drop_piece(1, '🔴')
      
      board.drop_piece(2, '🟡')
      board.drop_piece(2, '🟡')
      board.drop_piece(2, '🔴')
      
      board.drop_piece(3, '🟡')
      board.drop_piece(3, '🟡')
      board.drop_piece(3, '🟡')
      board.drop_piece(3, '🔴')
      
      expect(board.winner?('🔴')).to be true
    end
  end
end
