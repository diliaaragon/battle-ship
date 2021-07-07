require './user'

class Bot < User
  attr_accessor :turn, :positions, :index

  def initialize
    super
    @turn = 1
    @positions = []
    @index = 0
  end

  def locate_ship
    board = @boards[0]
    letters = %w{a b}
    orientation = letters[rand(2)]
    if orientation == 1
      x = rand(3)
      y = rand(6)
    else
      x = rand(6)
      y = rand(3)
    end
    case orientation
    when 'b'
      (0..3).each { |i| board.matrix[x + i][y] = 1 }
    when 'a'
      (0..3).each { |i| board.matrix[x][y + i] = 1 }
    else 
      puts 'Incorrect option'
    end
  end 

  def attacks
    attack = []
    if positions.empty?
      x = rand(7)
      y = rand(7)
      while check_coordinate?(x, y)
        print'This attack is repeated'
        x = rand(7)
        y = rand(7) 
        check_coordinate?(x, y)
      end
      attack << x 
      attack << y 
      return  attack
    else 
      if (@turn == 1) && (@positions.last[0] == 0)
        @turn += 1
      elsif (@turn == 2) && (@positions.last[0] == 6)
        @turn += 1
      elsif (@turn == 3) && (@positions.last[1] == 0)
       @turn += 1
      end

      if @turn != @positions.last[2]
        coordinates = @positions[0]
      else
        coordinates = @positions.last
      end

      case @turn
      when 1
        x = coordinates[0] - 1
        y = coordinates[1]
        attack << x
        attack << y
        return attack
      when 2
        x = coordinates[0] + 1
        y = coordinates[1] 
        attack << x
        attack << y
        return attack
      when 3
        x = coordinates[0]
        y = coordinates[1] - 1
        attack << x
        attack << y
        return attack
      when 4
        x = coordinates[0]
        y = coordinates[1] + 1
        attack << x
        attack << y
        return attack
      end
      
    end
  end
end