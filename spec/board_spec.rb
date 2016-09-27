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
            expect(board.game_board[5][4]).to eql :R
          end
        end

        context 'when column 4 is chosen' do
          it 'should place a piece in row 6 column 4' do
            board.place_piece(4, :R)
            expect(board.game_board[5][3]).to eql :R
          end
        end
      end

      context 'when a column is not empty' do
        it 'should place a piece on top of the existing piece' do
          board.place_piece(3, :R)
          board.place_piece(3, :R)
          expect(board.game_board[4][2]).to eql :R
        end
      end

      context 'when a column is full' do
        it 'should raise an error' do
          6.times do
            board.place_piece(2, :R)
          end
          expect(board.place_piece(2, :R)).to raise_error(IndexError)
        end
      end
    end
  end
end
