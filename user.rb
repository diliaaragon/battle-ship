require './board'
require './ship'

class User
  attr_accessor :boards, :ships
  def initialize
    @boards = []
    @ships = []
  end

  def create_boards_and_ship
    (0..1).each { @boards << Board.new(7)}
    @ships << Ship.new
  end

  def receive_attack?(x, y)
    board_ship = @boards[0]
    if board_ship.matrix[x][y] == 1
      board_ship.matrix[x][y] = 2
      ship =  @ships[0]
      ship.hits += 1
      return true
    else
      board_ship.matrix[x][y] = 3
      return false 
    end
  end

  def register_attack(x, y, result)
    board_attacks = @boards[1]
    if result
      board_attacks.matrix[x][y] = 2
    else
      board_attacks.matrix[x][y] = 3
    end
  end

  def check_coordinate?(x, y)
    board_ship = @boards[0]
    if board_ship.matrix[x][y] == 2 || board_ship.matrix[x][y]== 3 
      return true
    else
     return false 
    end
  end
end