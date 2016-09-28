module ConnectFour
  class Board
    attr_accessor :game_board

    def initialize
      @game_board = Array.new(6) {Array.new(7)}
    end

    def place_piece(column, piece)
      column -= 1 # minus 1 as user input will start from 1 instead of 0 which array positioning starts at
      row = get_empty_row(column)
      raise IndexError unless row
      @game_board[row][column] = piece
    end

    def get_empty_row(column)
      5.downto(0) do |row|
        return row if @game_board.fetch(row).fetch(column).nil?
      end
      return false
    end

    def full?
      @game_board.flatten.none? {|cell| cell.nil?}
    end

    def to_s
      (1..7).each {|num| print "#{num} "}
      puts
      @game_board.map { |row| row.map { |e| e || " " }.join("|") }.join("\n")
    end
  end
end
