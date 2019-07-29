# frozen_string_literal: true

require './base_character.rb'

class Bot < BaseCharacter
  private

  def choose_square
    return @board.get_square(4) if @board.get_square(4).empty?

    @board.avaliable_squares.sample
  end
end
