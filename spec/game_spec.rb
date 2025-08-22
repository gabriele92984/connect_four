# frozen_string_literal: true

require 'spec_helper'

describe Game do # rubocop:disable Metrics/BlockLength
  let(:player1) { Player.new('Player 1', '🔴') }
  let(:player2) { Player.new('Player 2', '🟡') }
  let(:game) { Game.new(player1, player2) }

  describe '#initialize' do
    it 'creates a game with two players' do
      expect(game.players).to eq([player1, player2])
      expect(game.current_player).to eq(player1)
    end
  end

  describe '#switch_player' do
    it 'switches to the next player' do
      expect(game.current_player).to eq(player1)
      game.switch_player
      expect(game.current_player).to eq(player2)
      game.switch_player
      expect(game.current_player).to eq(player1)
    end
  end

  describe '#game_over?' do
    it 'returns false for new game' do
      expect(game.game_over?).to be false
    end

    it 'returns true when board is full' do
      allow(game.board).to receive(:full?).and_return(true)
      expect(game.game_over?).to be true
    end

    it 'returns true when there is a winner' do
      allow(game.board).to receive(:winner?).and_return(true)
      expect(game.game_over?).to be true
    end
  end
end
