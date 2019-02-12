require './game'

game = Game.new

puts """
     
  0 1 2 3 4 5 6 
0|_|_|_|_|_|_|_|
1|_|_|_|_|_|_|_|
2|_|_|_|_|_|_|_|
3|_|_|_|_|_|_|_|
4|_|_|_|_|_|_|_|
5|_|_|_|_|_|_|_|
6|_|_|_|_|_|_|_|
  """
game.star
puts 'ingrese las cordenas para ubicar su barco'
print 'x: '
x = gets.chomp.to_i
print 'y: '
y = gets.chomp.to_i
puts 'Horientacion'
puts 'A. Horizontal'
puts 'B. Vertical'
orientation = gets.chomp
game.locate_ship(x,y,orientation)

game.list


