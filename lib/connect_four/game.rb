module ConnectFour
  class Game
    attr_accessor :current_player, :board
    attr_reader :players

    def initialize(player1, player2)
      @board = Board.new
      @players = [player1, player2].cycle
    end

    def change_player
      @current_player = @players.next
    end

    def is_draw?
      @board.full?
    end

    def winner?
      return false if board.last_row.nil?
      return winner_check?(row_arr) || winner_check?(column_arr) ? true : false
    end

    def row_arr
      board.game_board[board.last_row]
    end

    def column_arr
      board.game_board.transpose[board.last_column]
    end

    def winner_check?(arr)
      arr.chunk{|x| x}.map{|y, ys| [ys.length]}.flatten.select{|x| x > 3}.empty? ? false : true
    end
  end
end
