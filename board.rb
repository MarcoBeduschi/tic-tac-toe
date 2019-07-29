# frozen_string_literal: true
require './square.rb'

class Board
  attr_reader :pieces, :squares

  def initialize(game)
    @game = game
    @pieces = %w[0 1 2 3 4 5 6 7 8]
    @squares = setup_squares
  end

  def get_square(index)
    squares[index]
  end

  def set_quare_value(index, value)
    square = squares[index]

    return false unless square.empty?

    square.value = value
  end

  def avaliable_squares
    squares.map do |square|
      square if square.empty?
    end
  end

  def full?
    squares.all? { |s| !s.empty? }
  end

  private

  def setup_squares
    Array.new(9).map { Square.new(self) }
  end
end
