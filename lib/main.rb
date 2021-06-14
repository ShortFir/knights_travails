# frozen_string_literal: true

require_relative 'knight'
require_relative 'board'

# Game Loop
class Play
  def initialize
    @board = Board.new
    @knight = Knight.new(@board)
  end

  def game
    @knight.knight_moves([0, 0], [1, 2])
    @board.display
  end
end

Play.new.game
