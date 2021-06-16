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
    @board.display
    # sleep 1
    # puts "\e[H\e[2J"
    puts @knight.moves
    # @board.place_piece(@knight)
    # @board.display
    puts @board.board
    puts "moves.grid: #{@knight.moves.grid}"
    # puts "moves.n1n2: #{@knight.moves.n1n2}"
  end
end

Play.new.game
