# frozen_string_literal: true

class Bot
  attr_reader :marker

  def initialize(game, marker)
    @game = game
    @board = game.board
    @marker = marker
  end

  def make_move
    spot = nil

    spot = best_move until spot

    @board.pieces[spot] = @marker
    @board.set_quare_value(spot, @marker)
  end

  private

  def best_move
    return 4 if @board.get_square(4).empty?

    @board.avaliable_squares.map { |sq| @board.squares.index(sq) }.sample
  end
end
