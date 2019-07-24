class Board

  attr_reader :pieces

  def initialize(game)
    @game = game
    @pieces = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end
end
