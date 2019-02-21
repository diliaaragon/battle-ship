require './user'
require './board'

class Player < User

  def locate_ship?(x, y, orientation)
    board = @boards[0]
    switch = true
    if orientation == "b"
        if x <= 3
          (0..3).each do |i|
            board.matrix[x + i][y] = 1
          end
        else
          puts 'In this position it can not be located.'
          switch = false
        end
    elsif orientation == "a"
      if y <= 3
        (0..3).each do |i|
          board.matrix[x][y + i] = 1
       end
      else
        puts 'In this position it can not be located.'
        switch = false
      end
    else
      puts 'Incorrect option'
      switch = false
    end
   return switch
  end

  def list
    board_ship = @boards[0]
    board_attacks = @boards[1]
   puts 'Location of your ship'
    (0..6).each do |i|
      (0..6).each do |j|
        print "#{board_ship.matrix[i][j]}  "
      end
      print "\n"
    end
   puts '_____________________'
   puts 'Your Attacks'
    (0..6).each do |i|
      (0..6).each do |j|
        print "#{board_attacks.matrix[i][j]}  "
      end
      print "\n"
    end
  end
end