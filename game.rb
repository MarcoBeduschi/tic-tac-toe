# frozen_string_literal: true

require './board.rb'
require './player.rb'
require './bot.rb'
require './view.rb'

class Game
  attr_reader :board, :view, :bot

  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def initialize
    @view = View.new(self)
    @board = Board.new(self)
    @bot = Bot.new(self, 'X')
    @player = Player.new(self, 'O')
  end

  def start_game
    @view.render_game_start
    @view.render_board

    until game_over? || tie?
      [@player, @bot].each do |character|
        character.make_move
        @view.render_board

        break if game_over? || tie?
      end
    end
    @view.render_game_over
  end

  def game_over?
    WINNING_COMBINATIONS.detect do |kombination|
      combination = kombination.map { |index| @board.get_square(index) }

      return true if combination.map(&:empty?).none? &&
                     combination.map(&:value).uniq.length == 1
    end
  end

  def tie?
    @board.full?
  end
end

game = Game.new
game.start_game
