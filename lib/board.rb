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

  def full?
    @grid.flatten.none?(&:nil?)
  end

  def winner?(piece)
    check_horizontal(piece) || check_vertical(piece) || check_diagonal(piece)
  end

  def display
    puts "\n  0 1 2 3 4 5 6"
    @grid.each do |row|
      print "|"
      row.each do |cell|
        print cell.nil? ? " ⚪" : " #{cell}"
      end
      puts " |"
    end
    puts "-------------------"
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

  def check_horizontal(piece)
    @grid.each do |row|
      (0..3).each do |col|
        return true if row[col, 4].all? { |cell| cell == piece }
      end
    end
    false
  end

  def check_vertical(piece)
    (0..6).each do |col|
      (0..2).each do |row|
        return true if (0..3).all? { |i| @grid[row + i][col] == piece }
      end
    end
    false
  end

  def check_diagonal(piece)
    # Check diagonals from bottom-left to top-right
    (0..2).each do |row|
      (0..3).each do |col|
        return true if (0..3).all? { |i| @grid[row + i][col + i] == piece }
      end
    end

    # Check diagonals from top-left to bottom-right
    (3..5).each do |row|
      (0..3).each do |col|
        return true if (0..3).all? { |i| @grid[row - i][col + i] == piece }
      end
    end

    false
  end
end
