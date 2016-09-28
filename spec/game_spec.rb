require 'spec_helper'

module ConnectFour
  describe Game do
    subject(:game) { Game.new }

    it { expect(game).to be_instance_of Game }

    describe '#new' do
      context 'creates a players enumberable object' do
        it {expect(game.players).to be_kind_of Enumerable }
      end
    end
  end
end
