require './board'

class Game
  attr_accessor :boards_user, :boards_bots
  
  def initialize
    @boards_users = []
    @boards_bots = []
  end

  def star
    i = 0
    while i <= 2
      board_user = Board.new
      @boards_users << board_user
      board_bot = Board.new
      @boards_bots << board_bot
      i += 1
    end
  end

  def locate_ship(x,y,orientation)

    board = @boards_users[0]
    if orientation == "b"
      (0..3).each do |i|
        board.matrix[x + i][y] = 0
      end
    elsif orientation == "a"
      (0..3).each do |i|
        board.matrix[x][y + i] = 0
      end
    else
      puts 'Incorrect option'
    end
  end

  def list 
    board = @boards_users[0]
    puts board.matrix
  end

end