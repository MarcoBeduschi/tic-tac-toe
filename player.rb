# frozen_string_literal: true

class Player
  def initialize(game, marker)
    @game = game
    @board = game.board
    @view = game.view
    @bot = game.bot
    @marker = marker
  end

  def make_move
    spot = nil

    until spot
      spot = @view.get_input

      if @board.pieces[spot] != @bot.marker && @board.pieces[spot] != @marker
        @board.pieces[spot] = @marker
        @board.set_quare_value(spot, @marker)
      else
        spot = nil
      end
    end
  end
end
