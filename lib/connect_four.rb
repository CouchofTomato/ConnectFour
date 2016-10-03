require_relative 'connect_four/player'
require_relative 'connect_four/board'
require_relative 'connect_four/game'

def colours
  [:B, :W]
end


players = []
2.times do |num|
  puts "Yo homie number #{num + 1}, what's your name?"
  name = gets.chomp
  puts
  players << ConnectFour::Player.new(name, colours[num])
end
players = players.cycle
@game = ConnectFour::Game.new(players.next, players.next)
@game.change_player

def move
  puts "#{@game.current_player.name}, please enter a column"
  column = gets.chomp.to_i
  @game.board.place_piece(column, @game.current_player.piece)
  puts
  rescue IndexError
    puts "That column is full or isn't within bounds"
    retry
end

loop do
  system 'clear'
  puts @game.board
  puts
  move
  if @game.winner?
    puts @game.board
    puts "Congratulations #{@game.current_player.name}, you've won"
    break
  end
  if @game.is_draw?
    puts @game.board
    puts "It's a draw. GG"
    break
  end
  @game.change_player
end
