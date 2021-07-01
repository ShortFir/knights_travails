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

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def knight_moving_display
    print 'Start  Pos:'
    start = gets.chomp.split('').map(&:to_i)
    print 'Finish Pos:'
    finish = gets.chomp.split('').map(&:to_i)
    print start, finish, "\n"
    moves = @knight.knight_moves(start, finish)
    @board.place_piece(@knight, start)
    moves.each_with_index do |ele, index|
      show_board
      sleep 0.5
      @board.move_piece(ele, moves[index + 1])
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def fill_board(piece)
    @board.board.each_key do |grid|
      show_board
      @board.place_piece(piece, grid)
      sleep 0.04
    end
    show_board
  end

  def show_board
    print "\e[H\e[2J"
    @board.display
  end
end

Play.new.game
