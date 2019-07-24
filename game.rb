require './board.rb'
require './player.rb'
require './bot.rb'
require './view.rb'

class Game

  attr_reader :board, :view, :bot

  def initialize
    @board = Board.new(self)
    @bot = Bot.new(self, 'X')
    @human = Player.new(self, 'O')
    @view = View.new(self)
  end

  def start_game
    @view.render_game_start
    @view.render_board

    until game_over?(@board) || tie(@board)
      @human.make_move

      if !game_over?(@board) && !tie(@board)
        @bot.make_move
      end

      @view.render_board
    end
    @view.render_game_over
  end

  def game_over?(b)
    [b.pieces[0], b.pieces[1], b.pieces[2]].uniq.length == 1 ||
    [b.pieces[3], b.pieces[4], b.pieces[5]].uniq.length == 1 ||
    [b.pieces[6], b.pieces[7], b.pieces[8]].uniq.length == 1 ||
    [b.pieces[0], b.pieces[3], b.pieces[6]].uniq.length == 1 ||
    [b.pieces[1], b.pieces[4], b.pieces[7]].uniq.length == 1 ||
    [b.pieces[2], b.pieces[5], b.pieces[8]].uniq.length == 1 ||
    [b.pieces[0], b.pieces[4], b.pieces[8]].uniq.length == 1 ||
    [b.pieces[2], b.pieces[4], b.pieces[6]].uniq.length == 1
  end

  def tie(b)
    b.pieces.all? { |s| s == "X" || s == "O" }
  end

end
game = Game.new
game.start_game
