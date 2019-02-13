require './board'

class Game
  attr_accessor :boards_user, :boards_bots, :cont_user, :cont_bot
  
  def initialize
    @boards_users = []
    @boards_bots = []
    @cont_user = 0
    @cont_bot = 0
  end

  def star
    i = 0
    while i <= 2
      board_user = Board.new
      (0..6).each do |i|
        (0..6).each do |j|
          board_user.matrix[i][j] = 0
        end
      end
      @boards_users << board_user
      board_bot = Board.new
      (0..6).each do |i|
        (0..6).each do |j|
          board_bot.matrix[i][j] = 0
        end
      end
      @boards_bots << board_bot
      i += 1
    end
  end

  def locate_ship_user(x,y,orientation)
    board = @boards_users[0]
    if orientation == "b"
        if x <= 3
          (0..3).each do |i|
            board.matrix[x + i][y] = 1
          end
        else
          puts 'En esta pocicion no se puede ubicar'
        end
    elsif orientation == "a"
      if y <= 3
        (0..3).each do |i|
          board.matrix[x][y + i] = 1
       end
      else
        puts 'En esta pocicion no se puede ubicar'
      end
    else
      puts 'Incorrect option'
    end
  end

  def locate_ship_bot(x,y,orientation)
    board = @boards_bots[0]
    if orientation == "b"
      (0..3).each do |i|
        board.matrix[x + i][y] = 1
      end
    elsif orientation == "a"
      (0..3).each do |i|
        board.matrix[x][y + i] = 1
      end
    else
      puts 'Incorrect option'
    end
  end

  def attacks_user(i, j)
    board_ship = @boards_bots[0]
    board_attacks = @boards_users[1]
    if board_ship.matrix[i][j] == 1
      board_attacks.matrix[i][j] = 2
      @cont_user += 1
      puts 'Le diste'
    else
      board_attacks.matrix[i][j] = 3
      puts 'Agua'
    end 
  end

  def attacks_bot(i, j)
    board_ship = @boards_users[0]
    board_attacks = @boards_bots[1]
    if board_ship.matrix[i][j] == 1
      board_attacks.matrix[i][j] = 2
      @cont_bot += 1
      puts 'Le diste'
    else
      board_attacks.matrix[i][j] = 3
      puts 'Agua'
    end 
  end


  def list 
    board_ship = @boards_users[0]
    board_attacks = @boards_users[1]
   puts 'Ubicacio de su barco'
    (0..6).each do |i|
      (0..6).each do |j|
        print "#{board_ship.matrix[i][j]}  "
      end
      print "\n"
    end
   puts 'Sus ataques'
    (0..6).each do |i|
      (0..6).each do |j|
        print "#{board_attacks.matrix[i][j]}  "
      end
      print "\n"
    end
  end
end