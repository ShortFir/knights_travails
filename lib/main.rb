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
    knight_moving_display
    # fill_board(@knight)

    # @knight.knight_moves([0, 0], [7, 7])
    # @knight.knight_moves([4, 7], [5, 0])
    # @knight.knight_moves([3, 3], [5, 0])
    # @knight.knight_moves([3, 3], [3, 3])
    # @knight.knight_moves([0, 0], [0, 7])
    # @knight.knight_moves([0, 7], [7, 7])

    # print "knight_moves([0, 0], [1, 2]) == #{@knight.knight_moves([0, 0], [1, 2])}\n"
    # print "knight_moves([0, 0], [3, 3]) == #{@knight.knight_moves([0, 0], [3, 3])}\n"
    # print "knight_moves([3, 3], [0, 0]) == #{@knight.knight_moves([3, 3], [0, 0])}\n"
    # print "knight_moves([0, 0], [7, 7]) == #{@knight.knight_moves([0, 0], [7, 7])}\n"
  end

  def knight_moving_display
    show_board
    start, finish = user_input
    display_moves(start, finish)
    print "\n", 'All done!', "\n", 'Press enter to exit.'
    gets
    clear_screen
  end

  def display_moves(start, finish)
    @board.place_piece(@knight, start)
    moves = @knight.knight_moves(start, finish)
    moves.each_with_index do |ele, index|
      show_board
      sleep 0.5
      @board.move_piece(ele, moves[index + 1])
    end
  end

  def user_input
    print "\n", 'Start  Pos (2 Int):'
    start = gets.chomp.split('').map(&:to_i)
    print 'Finish Pos (2 Int):'
    finish = gets.chomp.split('').map(&:to_i)
    [start, finish]
  end

  def fill_board(piece)
    @board.board.each_key do |grid|
      show_board
      @board.place_piece(piece, grid)
      sleep 0.04
    end
    show_board
  end

  def show_board
    clear_screen
    @board.display
  end

  def clear_screen
    print "\e[H\e[2J"
  end
end

Play.new.game
