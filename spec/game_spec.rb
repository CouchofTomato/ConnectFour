require 'spec_helper'

module ConnectFour
  describe Game do
    subject(:game) { Game.new(player1, player2) }
    let(:player1) { ConnectFour::Player.new("Austin", :W) }
    let(:player2) { ConnectFour::Player.new("Kevin", :B) }
    let(:board) { game.board}

    it { expect(game).to be_instance_of Game }

    describe '#new' do
      context 'creates a players variable' do
        it {expect(game.players).to be_kind_of Enumerator }
      end
    end

    describe '#change_player' do
      context 'on the first turn' do
        it 'player1 should be the current player' do
          game.change_player
          expect(game.current_player).to eql player1
        end
      end

      context 'on the second turn' do
        it 'player2 should be the current player' do
          2.times { game.change_player }
          expect(game.current_player).to eql player2
        end
      end
    end

    describe '#is_draw?' do
      context 'when the board is not full' do
        it 'should return false' do
          expect(game.is_draw?).to be false
        end
      end

      context 'when the board is full' do
        it 'should return true' do
          board.game_board.map!{|row| row.map {|col| col = :R}}
          expect(game.is_draw?).to be true
        end
      end
    end

    describe '#winner?' do
      context 'when there is no winner' do
        it 'should return false' do
          expect(game.winner?).to be false
        end
      end

      context 'when there is a winner' do
        context 'when there are four consecutive pieces in the same row' do
          it 'should return true' do
            4.times do
              game.board.place_piece(2, :R)
            end
            expect(game.winner?).to be true
          end
        end
      end
    end
  end
end
