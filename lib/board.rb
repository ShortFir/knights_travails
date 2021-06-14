# frozen_string_literal: true

# Chess Board
class Board
  attr_reader :board

  def initialize
    # @board = construct_board_array
    @board = construct_board_hash
  end

  def display
    # display_board_array
    display_board_hash
  end

  def place_piece(piece, position = [0, 0])
    # @board[position[1]][position[0]] = piece
    @board[position] = piece
  end

  # def update_display(loc = [0, 0])
  #   @board[loc[1]][loc[0]] = yield if block_given?
  # end

  private

  def construct_board_array
    Array.new(8) { Array.new(8) { ' ' } }
  end

  def display_board_array
    number = 7
    @board.reverse_each do |row|
      print "#{number} "
      number -= 1
      row.each do |square|
        print "#{square} "
      end
      puts
    end
    puts '  0 1 2 3 4 5 6 7'
    # puts '  a b c d e f g h'
  end

  def construct_board_hash
    8.times.with_object({}) do |row, hash|
      8.times do |column|
        array = [row, column]
        hash.store(array, ' ')
      end
    end
  end

  # TODO: Rework to interpolate line, constructed in another method #{line'1'} etc...
  # rubocop:disable Metrics/AbcSize, Naming/MethodParameterName, Metrics/MethodLength
  def display_board_hash(b = @board)
    chess = <<~BOARD
      7 #{b[[0, 7]]} #{b[[1, 7]]} #{b[[2, 7]]} #{b[[3, 7]]} #{b[[4, 7]]} #{b[[5, 7]]} #{b[[6, 7]]} #{b[[7, 7]]}
      6 #{b[[0, 6]]} #{b[[1, 6]]} #{b[[2, 6]]} #{b[[3, 6]]} #{b[[4, 6]]} #{b[[5, 6]]} #{b[[6, 6]]} #{b[[7, 6]]}
      5 #{b[[0, 5]]} #{b[[1, 5]]} #{b[[2, 5]]} #{b[[3, 5]]} #{b[[4, 5]]} #{b[[5, 5]]} #{b[[6, 5]]} #{b[[7, 5]]}
      4 #{b[[0, 4]]} #{b[[1, 4]]} #{b[[2, 4]]} #{b[[3, 4]]} #{b[[4, 4]]} #{b[[5, 4]]} #{b[[6, 4]]} #{b[[7, 4]]}
      3 #{b[[0, 3]]} #{b[[1, 3]]} #{b[[2, 3]]} #{b[[3, 3]]} #{b[[4, 3]]} #{b[[5, 3]]} #{b[[6, 3]]} #{b[[7, 3]]}
      2 #{b[[0, 2]]} #{b[[1, 2]]} #{b[[2, 2]]} #{b[[3, 2]]} #{b[[4, 2]]} #{b[[5, 2]]} #{b[[6, 2]]} #{b[[7, 2]]}
      1 #{b[[0, 1]]} #{b[[1, 1]]} #{b[[2, 1]]} #{b[[3, 1]]} #{b[[4, 1]]} #{b[[5, 1]]} #{b[[6, 1]]} #{b[[7, 1]]}
      0 #{b[[0, 0]]} #{b[[1, 0]]} #{b[[2, 0]]} #{b[[3, 0]]} #{b[[4, 0]]} #{b[[5, 0]]} #{b[[6, 0]]} #{b[[7, 0]]}
        0 1 2 3 4 5 6 7
    BOARD
    print chess
  end
  # rubocop:enable Metrics/AbcSize, Naming/MethodParameterName, Metrics/MethodLength
end
