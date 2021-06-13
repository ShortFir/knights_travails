# frozen_string_literal: true

require_relative 'knight'
require_relative 'board'

# Game Loop
class Play
  def initialize
    @board = Board.new
    @knight = Knight.new
  end

  def game
    @knight.knight_moves([0, 0], [1, 2])
  end
end

Play.new.game
