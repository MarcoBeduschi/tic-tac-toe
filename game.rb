# frozen_string_literal: true

require './board.rb'
require './player.rb'
require './bot.rb'
require './view.rb'

class Game
  attr_reader :board, :view, :bot

  def initialize
    @view = View.new(self)
    @board = Board.new(self)
    @bot = Bot.new(self, 'X')
    @human = Player.new(self, 'O')
  end

  def start_game
    @view.render_game_start
    @view.render_board

    until game_over? || tie
      @human.make_move

      @bot.make_move if !game_over? && !tie

      @view.render_board
    end
    @view.render_game_over
  end

  def game_over?
    b = @board

    [b.pieces[0], b.pieces[1], b.pieces[2]].uniq.length == 1 ||
      [b.pieces[3], b.pieces[4], b.pieces[5]].uniq.length == 1 ||
      [b.pieces[6], b.pieces[7], b.pieces[8]].uniq.length == 1 ||
      [b.pieces[0], b.pieces[3], b.pieces[6]].uniq.length == 1 ||
      [b.pieces[1], b.pieces[4], b.pieces[7]].uniq.length == 1 ||
      [b.pieces[2], b.pieces[5], b.pieces[8]].uniq.length == 1 ||
      [b.pieces[0], b.pieces[4], b.pieces[8]].uniq.length == 1 ||
      [b.pieces[2], b.pieces[4], b.pieces[6]].uniq.length == 1
  end

  def tie
    @board.full?
  end
end

game = Game.new
game.start_game
