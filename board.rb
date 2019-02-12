class Board
  attr_accessor :matrix

  def initialize
    @matrix = Array.new(7) { Array.new(7)} 
  end
end
