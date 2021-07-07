require './board'
require './user'
require './bot'
require './player'

class Game
  def board
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
  end

  def initialize
    @player = Player.new
    @player.create_boards_and_ship
    @bot = Bot.new
    @bot.create_boards_and_ship
  end

  def locate_ship_player(x, y, orientation)
    @player.locate_ship?(x, y, orientation)
  end

  def locate_ship_bot
    @bot.locate_ship
  end

  def attacks_player(i, j)
    result = @bot.receive_attack?(i, j)
    if result 
      puts 'You hit him!'
    else
      puts 'Water!'
    end
    result
  end

  def check_coordinate_player?(i, j)
    @player.check_coordinate?(i, j)
  end

  def register_attack_player(i, j, result)
    @player.register_attack(i, j, result)
  end
  
  def attacks_bot
    x = @bot.attacks[0]
    y = @bot.attacks[1]
    result = @player.receive_attack?(x, y)
    @bot.register_attack(x, y, result)
    if result 
      turno = []
      turno << x
      turno << y
      turno << @bot.turn
      @bot.positions << turno
      puts 'You hit him!'
    elsif !result && @bot.positions.empty? 
      puts 'Water!'
    elsif !result && @bot.positions.empty? == false 
      @bot.turn += 1
      puts 'Water!'
    end
  end

  def validate_coordinates?(i, j)
    if i >= 7 || j >= 7
      return false
    end
    return true
  end

  def hits_player
    ships_player = @player.ships[0]
    return ships_player.hits
  end

  def hits_bot
    ships_bot = @bot.ships[0]
    return ships_bot.hits
  end

  def list_player
    @player.list
  end

end