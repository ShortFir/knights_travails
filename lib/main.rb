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
    # puts "\e[H\e[2J"
    @board.display
    # sleep 1
    # puts "\e[H\e[2J"
    @board.place_piece(@knight)
    @board.display
    puts @board.board
  end
end

Play.new.game
