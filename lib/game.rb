class Game
  attr_reader :players, :current_player, :board

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = player1
    @board = Board.new
  end

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end

  def game_over?
    board.full? || board.winner?(@players[0].piece) || board.winner?(@players[1].piece)
  end

  def winner
    return @players[0] if board.winner?(@players[0].piece)
    return @players[1] if board.winner?(@players[1].piece)
    nil
  end

  def play
    until game_over?
      play_turn
    end
    display_result
  end

  def play_turn
    board.display
    puts "#{current_player.name}'s turn (#{current_player.piece})"
    
    column = get_valid_column # This already drops the piece
    # REMOVE: board.drop_piece(column, current_player.piece)
    
    switch_player unless game_over?
  end

  private

  def get_valid_column
    loop do
      print "Enter column (0-6): "
      column = gets.chomp.to_i
      
      # Check if column is valid and not full
      if column.between?(0, 6)
        # Try to drop the piece - if successful, return the column
        return column if board.drop_piece(column, current_player.piece)
      end
      
      puts "Invalid column or column is full. Try again."
    end
  end

  def display_result
    board.display
    if winner
      puts "#{winner.name} wins!"
    else
      puts "It's a draw!"
    end
  end
end
