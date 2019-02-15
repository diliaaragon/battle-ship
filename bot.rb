require './user'

class Bot < User
  def locate_ship
    board = @boards[0]
    letters = %w{a b}
    orientation = letters[rand(2)]
    if orientation == 1
      x = rand(4)
      y = rand(7)
    else
      x = rand(7)
      y = rand(4)
    end
    puts "#{x}, #{y}"
    case orientation
    when 'b'
      (0..3).each { |i| board.matrix[x + i][y] = 1 }
    when 'a'
      (0..3).each { |i| board.matrix[x][y + i] = 1 }
    else 
      puts 'Incorrect option'
    end
  end 
end