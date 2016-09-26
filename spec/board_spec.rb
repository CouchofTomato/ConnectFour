require 'spec_helper'

module ConnectFour
  describe Board do
    subject(:board) { Board.new }

    it { expect(board).to be_instance_of Board }

    describe '#new' do
      context 'creates a board Array' do
        it { expect(board.game_board).to be_kind_of Array }
        it 'has 6 rows' do
          expect(board.game_board.size).to eql 6
        end
        it 'has 7 columns' do
          expect(board.game_board[0].size).to eql 7
        end
      end
    end

    describe 'place_piece' do
      context 'when a column is empty' do
        context 'when column 5 is chosen' do
          it 'should place a piece in row 6 column 5' do
            board.place_piece(5, :R)
            expect(board[4][5]).to eql :R
          end
        end
      end
    end
  end
end
