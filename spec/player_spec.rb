require 'spec_helper'

module ConnectFour
  describe Player do
    subject(:player) {Player.new(player_name, player_piece)}
    let(:player_name) { 'Austin' }
    let(:player_piece) { :R }

    it { expect(player).to be_instance_of Player }

    describe '#new' do
      context 'with a name argument' do
        it 'sets the name variable to the supplied argument' do
          expect(player.name).to eql(player_name)
        end
      end

      context 'with a piece argument' do
        it 'sets the piece variable to the supplied argument' do
          expect(player.piece).to eql(player_piece)
        end
      end
    end
  end
end
