require './game'
require 'pry'

continue = true
while continue
  game = Game.new
  game.board
  result = false
  while !result
    puts 'Enter the coordinates to locate your boat'
    print 'x: '
    x = gets.chomp.to_i
    print 'y: '
    y = gets.chomp.to_i
    puts 'Orientacion'
    puts 'A. Horizontal'
    puts 'B. Vertical'
    orientation = gets.chomp
    result = game.locate_ship_player(x, y, orientation)
  end
  puts "Locating your opponent's ship ..."
  game.locate_ship_bot
  print "Ready! \n"
  puts'-------------------------------------------------------------------------------'

  while (game.hits_player < 4) && (game.hits_bot < 4)
    puts 'Enter the coordinates to attack your opponent'
    print 'x: '
    i = gets.chomp.to_i
    print 'y: '
    j = gets.chomp.to_i
    while game.validate_coordinates?(i, j) == false
      puts 'Incorrect coordinates'
      puts 'Enter the coordinates to attack your opponent'
      print 'x: '
      i = gets.chomp.to_i
      print 'y: '
      j = gets.chomp.to_i
      game.validate_coordinates?(i, j)
    end 
    while game.check_coordinate_player?(i, j)
      puts 'This attack is repeated'
      puts 'Enter the coordinates to attack your opponent'
      print 'x: '
      i = gets.chomp.to_i
      print 'y: '
      j = gets.chomp.to_i
      game.check_coordinate_player?(i, j)
    end
    result = game.attacks_player(i, j)
    game.register_attack_player(i, j, result)

    puts 'Your opponent is creating his strategy'
    game.attacks_bot
    
    puts"#{game.board}   #{game.list_player}"
  end

  if game.hits_player == 0
    puts 'WINNER'
  else
   puts 'YOU HAVE LOST'
  end

  puts 'Play again?y/n'
  reply = gets.chomp
  if reply == "n"
    continue = false
  elsif reply == "y"
    continue = true
  end
end