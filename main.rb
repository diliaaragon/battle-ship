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
game.locate_ship_user(x, y, orientation)

print 'Ubicando el barco de su oponente...'
x = rand(4)
y = rand(4)
letters = %w{a b}
i = letters.length
orientation = letters[rand(i)]
game.locate_ship_bot(x, y, orientation)
print 'Listo'
puts'------------------------------------------------------------------------------------------------'

while game.cont_user <= 4 or game.cont_bot <= 4
  puts 'ingrese las cordenas para atacar a su ponente'
  print 'x: '
  i = gets.chomp.to_i
  print 'y: '
  j = gets.chomp.to_i
  game.attacks_user(i, j)
  
  print 'Su oponente esta armando su estrategia!'
  i = rand(7)
  j = rand(7)
  game.attacks_bot(i, j)

  game.list
end

if game.cont_user == 4
  puts 'GANADOR'
else
  puts 'HAS PERDIDO'
end

