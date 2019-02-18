require './game'

continue = true
while continue
  game = Game.new
  game.board
  puts 'Enter the coordinates to locate your boat'
  print 'x: '
  x = gets.chomp.to_i
  print 'y: '
  y = gets.chomp.to_i
  puts 'Orientation'
  puts 'A. Horizontal'
  puts 'B. Vertical'
  orientation = gets.chomp
  result = game.locate_ship_player(x, y, orientation)
  while result 
    puts 'Enter the coordinates to locate your boat'
    print 'x: '
    x = gets.chomp.to_i
    print 'y: '
    y = gets.chomp.to_i
    puts 'Orientacion'
    puts 'A. Horizontal'
    puts 'B. Vertical'
    orientation = gets.chomp
    game.locate_ship_player(x, y, orientation)
    result = game.locate_ship_player(x, y, orientation)
  end
  puts "Locating your opponent's ship ..."
  game.locate_ship_bot
  print "Ready \n"
  puts'-------------------------------------------------------------------------------'

  while (game.hits_player < 4) && (game.hits_bot < 4)
    puts 'Enter the coordinates to attack your opponent'
    print 'x: '
    i = gets.chomp.to_i
    print 'y: '
    j = gets.chomp.to_i
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

   if game.hits_player == 0
      puts 'Your opponent is putting together his strategy!'
      x = rand(7)
      y = rand(7)
      
      while game.check_coordinate_bot?(x, y)
        puts 'This attack is repeated'
        puts 'Your opponent is putting together his strategy!'
        
      end 
      result = game.attacks_bot(x, y)
      game.register_attack_bot(x, y, result)
      if result = true
        f = x
        c = y
      end
    else 
      puts 'Your opponent is putting together his strategy!'
      orientation_bot = rand(2)
      if orienation == 1
        f += 1
      else 
        c += 1
      end
      result = game.attacks_bot(f, c)
      game.register_attack_bot(f, c, result)
    end

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