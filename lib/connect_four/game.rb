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
      false
    end
  end
end
