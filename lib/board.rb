class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) }
  end

  def drop_piece(column, piece)
    return false unless valid_column?(column)
    
    row = find_empty_row(column)
    return false unless row
    
    @grid[row][column] = piece
    true
  end

  private

  def valid_column?(column)
    column.between?(0, 6)
  end

  def find_empty_row(column)
    (5).downto(0) do |row|
      return row if @grid[row][column].nil?
    end
    nil
  end
end
