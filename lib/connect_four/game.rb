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
      board.row.chunk{|x| x}.map{|y, ys| [ys.length]}.flatten.select{|x| x > 3}.empty?
    end
  end
end
