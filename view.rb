# frozen_string_literal: true

class View
  def initialize(game)
    @game = game
  end

  def render_game_start
    puts 'Enter [0-8]:'
  end

  def render_game_over
    puts 'Game Over'
  end

  def render_board
    squares = @game.board.squares

    puts " #{render_square(squares, 0)} | #{render_square(squares, 1)} | #{render_square(squares, 2)}\n==+==+==\n #{render_square(squares, 3)} | #{render_square(squares, 4)} | #{render_square(squares, 5)}\n==+==+==\n #{render_square(squares, 6)} | #{render_square(squares, 7)} | #{render_square(squares, 8)}\n"
    puts "\n\n"
  end

  def get_input
    input = gets.chomp.to_i

    if input.positive? && input <= 9
      input
    else
      puts 'Input Invalid. Enter a number between 1 and 9.'
      get_input
    end
  end

  private

  def render_square(squares, index)
    squares[index].value || index + 1
  end
end
