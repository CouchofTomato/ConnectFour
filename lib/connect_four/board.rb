module ConnectFour
  class Board
    attr_accessor :game_board

    def initialize
      @game_board = Array.new(6) {Array.new(7)}
    end

    def place_piece(row, column, piece)
      @game_board[row][column] = piece
    end
  end
end
