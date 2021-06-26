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
    # print @board.board.keys
    puts @knight.adjacency_list
    # fill_board(@knight)

    # @knight.moves.each_with_index do |node, index|
    #   print "Node #{index + 1}: Grid #{node.grid}: #{node}\n"
    # end

    # @knight.knight_moves([0, 0], [1, 2])
    # @knight.knight_moves([0, 0], [3, 3])
    # @knight.knight_moves([3, 3], [0, 0])
    # [[0,0],[1,2]]
    # [[0,0],[1,2],[3,3]]
    # [[3,3],[1,2],[0,0]]
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
    print "\e[H\e[2J"
    @board.display
  end
end

Play.new.game
