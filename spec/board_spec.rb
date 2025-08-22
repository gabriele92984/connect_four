require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    it 'creates a 6x7 grid' do
      board = Board.new
      expect(board.grid.size).to eq(6)
      expect(board.grid.all? { |row| row.size == 7 }).to be true
    end

    it 'initializes with empty cells' do
      board = Board.new
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
      3.times { board.drop_piece(0, '🔴') }
      3.times { board.drop_piece(0, '🟡') }
      expect(board.drop_piece(0, '🟡')).to be false
    end

    it 'returns false for invalid column' do
      expect(board.drop_piece(-1, '🔴')).to be false
      expect(board.drop_piece(7, '🔴')).to be false
    end
  end
end
