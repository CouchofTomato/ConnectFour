module ConnectFour
  class Board
    attr_accessor :game_board

    def initialize
      @game_board = Array.new(6) {Array.new(7)}
    end

    def place_piece(column, piece)
      @game_board[4][5] = piece
    end
  end
end
