# frozen_string_literal: true

require './square.rb'

class Board
  attr_reader :squares

  def initialize(game)
    @game = game
    @squares = setup_squares
  end

  def mark_square(square, marker)
    return unless avaliable_squares.include?(square)

    square.value = marker
  end

  def get_square(index)
    squares[index]
  end

  def avaliable_squares
    squares.select(&:empty?)
  end

  def full?
    squares.all? { |s| !s.empty? }
  end

  private

  def setup_squares
    Array.new(9).map { Square.new(self) }
  end
end
