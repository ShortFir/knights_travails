# frozen_string_literal: true

require_relative 'knight'
require_relative 'board'

# Game Loop
class Play
  def initialize
    @board = Board.new
    @knight = Knight.new(@board.board.keys)
  end

  def game
    # puts "\e[H\e[2J"
    # sleep 1
    @board.display
    @board.place_piece(@knight)
    @board.display

    # print @knight.moves, "\n"
    # print @knight.moves.l2d1, "\n"
    # print @knight.moves.r2u1, "\n"
    # print @knight.moves.r2u1.l2d1, "\n"
  end
end

Play.new.game
