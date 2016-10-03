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
      winner_check?(row_arr) || winner_check?(column_arr) || diagonal_winner ? true : false
    end

    def row_arr
      board.game_board[board.last_row]
    end

    def column_arr
      board.game_board.transpose[board.last_column]
    end

    def diagonal_winner
      return false if diagonal_arr.empty?
      diagonal_arr.select{|arr| arr.length > 3}.any? {|arr| winner_check?(arr)}
    end

    def diagonal_arr
      [board.game_board, board.game_board.map(&:reverse)].inject([]) do |all_diags, matrix|
        ((-matrix.count + 1)..matrix.first.count).each do |offet_index|
          diagonal = []
          (matrix.count).times do |row_index|
            col_index = offet_index + row_index
            diagonal << matrix[row_index][col_index] if col_index >= 0
          end
          all_diags << diagonal.compact if diagonal.compact.count > 1
        end
        all_diags
      end
    end

    def winner_check?(arr)
      arr.chunk{|x| x}.any? {|y, ys| ys.length > 3}
    end
  end
end
