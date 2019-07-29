# frozen_string_literal: true

class BaseCharacter
  def initialize(game, marker)
    @game = game
    @board = game.board
    @marker = marker
  end

  def make_move
    square = choose_square

    make_move unless @board.mark_square(square, @marker)
  end

  private

  def choose_square; end
end
