# frozen_string_literal: true

require 'spec_helper'

describe Player do
  describe '#initialize' do
    it 'creates a player with name and piece' do
      player = Player.new('Alice', '🔴')
      expect(player.name).to eq('Alice')
      expect(player.piece).to eq('🔴')
    end
  end
end
