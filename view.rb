class View
  def initialize(game)
    @game = game
    @board = game.board
  end

  def render_game_start
    puts "Enter [0-8]:"
  end

  def render_game_over
    puts "Game Over"
  end

  def render_board
    puts " #{@board.pieces[0]} | #{@board.pieces[1]} | #{@board.pieces[2]}\n===+===+===\n #{@board.pieces[3]} | #{@board.pieces[4]} | #{@board.pieces[5]}\n===+===+===\n #{@board.pieces[6]} | #{@board.pieces[7]} | #{@board.pieces[8]}\n"
  end

  def get_input
    gets.chomp.to_i
  end
end
