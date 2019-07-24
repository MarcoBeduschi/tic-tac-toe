class Bot

  attr_reader :marker

  def initialize(game, marker)
    @game = game
    @board = game.board
    @marker = marker
  end

  def make_move
    spot = nil

    until spot
      spot = get_best_move
    end

    @board.pieces[spot] = @marker
  end

  private


  def get_best_move
    return 4 if @board.pieces[4] == "4"

    available_spaces = []

    @board.pieces.each do |s|
      if s != "X" && s != @marker
        available_spaces << s
      end
    end

    n = rand(0..available_spaces.count)
    return available_spaces[n].to_i
  end
end
