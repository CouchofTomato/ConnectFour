require 'spec_helper'

module ConnectFour
  describe Player do
    subject(:player) {Player.new(name: player_name, piece: player_piece)}
    let(:player_name) { 'Austin' }
    let(:player_piece) { :R }

    it { expect(player).to be_kind_of Player }

    describe '#new' do
      context 'with a name argument' do
        it 'sets the name variable to the supplied argument' do
          expect(player.name).to eql(player_name)
        end
      end

      context 'with no name argument' do
        let(:player2) {Player.new}
        it 'sets a default name of Kevin' do
          expect(player2.name).to eql('Kevin')
        end
      end

      context 'with a piece argument' do
        it 'sets the piece variable to the supplied argument' do
          expect(player.piece).to eql(player_piece)
        end
      end

      context 'with no piece argument' do
        let(:player3) {Player.new}
        it 'sets a default name of Kevin' do
          expect(player3.piece).to eql(:R)
        end
      end
    end
  end
end
