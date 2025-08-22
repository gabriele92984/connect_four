# frozen_string_literal: true

# lib/connect_four.rb
require_relative 'board'
require_relative 'player'
require_relative 'game'

class ConnectFour # rubocop:disable Style/Documentation
  def self.play
    puts ''
    puts 'Welcome to Connect Four!'

    player1 = Player.new('Player 1', '🔴')
    player2 = Player.new('Player 2', '🟡')

    game = Game.new(player1, player2)
    game.play

    play_again?
  end

  def self.play_again?
    print 'Play again? (y/n): '
    response = gets.chomp.downcase
    play if response == 'y'
    puts 'Thanks for playing!'
  end
end
