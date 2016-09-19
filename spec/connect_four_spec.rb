require 'spec_helper'

module ConnectFour
  describe Game do
    let(:new_game) { ConnectFour::Game.new }

    describe '#start' do
      let(:output) { double('output').as_null_object }
      specify { expect { new_game.start }.to output('Welcome to Connect Four').to_stdout }
      it 'sends a welcome message'
      it 'gets player information'
    end
  end
end
