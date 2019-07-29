class Square
  attr_accessor :value

  def initialize(board)
    @board = board
    @value = nil
  end

  def empty?
    value.nil?
  end
end
