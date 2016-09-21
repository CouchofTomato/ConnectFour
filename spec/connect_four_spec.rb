require 'spec_helper'

module ConnectFour
  describe Game do
    let(:new_game) { ConnectFour::Game.new }

    describe '#start' do
      it 'displays a welcome message' do
        expect { new_game.start }.to output(/Welcome to Connect Four/).to_stdout
      end
    end
  end
end
