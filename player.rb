# frozen_string_literal: true

require './base_character.rb'

class Player < BaseCharacter
  def initialize(game, marker)
    @view = game.view
    super
  end

  private

  def choose_square
    @board.get_square(@view.get_input - 1)
  end
end
