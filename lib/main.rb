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
    moves = display_moves(start, finish)
    puts
    moves.each { |move| print "#{move}\n" }
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
    moves
  end

  def user_input
    print "\n", 'Horizontal then Vertical.', "\n"
    print 'Input coordinates thusly: 00 or 56 or 77 etc.', "\n\n"
    print 'Start  Position:'
    start = return_input
    print 'Finish Position:'
    finish = return_input
    [start, finish]
  end

  # TODO: letters convert to 0, so need to redo this section
  def return_input
    input = []
    loop do
      input = gets.chomp.split('').map(&:to_i)
      break if verify_input(input)

      print 'Enter two seperate digits from 0 to 7:'
    end
    input
  end

  def verify_input(input)
    return false unless input.length == 2
    return false unless input[0] >= 0
    return false unless input[0] <= 7
    return false unless input[1] >= 0
    return false unless input[1] <= 7

    true
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
