module ConnectFour
  class Board
    attr_reader :last_row, :last_column
    attr_accessor :game_board

    def initialize
      @game_board = Array.new(6) {Array.new(7)}
    end

    def place_piece(column, piece)
      @last_column = column - 1 # minus 1 as user input will start from 1 instead of 0 which array positioning starts at
      @last_row = get_empty_row(@last_column)
      raise IndexError unless @last_row
      @game_board[@last_row][@last_column] = piece
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
