class Board
  attr_accessor :matrix
  def initialize(size)
   @matrix = Array.new(size, 0) { Array.new(size, 0) }
  end
end
