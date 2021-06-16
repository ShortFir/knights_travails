# frozen_string_literal: true

# Chess Board
class Board
  HASH_DEFAULT = ' '
  attr_reader :board

  def initialize
    # @board = construct_board_array
    @board = construct_board_hash
  end

  def display
    # display_board_array
    print display_board_hash
  end

  def place_piece(piece, position = [0, 0])
    # @board[position[1]][position[0]] = piece
    @board[position] = piece
  end

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
        hash.store(array, HASH_DEFAULT)
      end
    end
  end

  def display_board_hash
    <<~BOARD
      7 #{board_hash_lines(7).chomp}
      6 #{board_hash_lines(6).chomp}
      5 #{board_hash_lines(5).chomp}
      4 #{board_hash_lines(4).chomp}
      3 #{board_hash_lines(3).chomp}
      2 #{board_hash_lines(2).chomp}
      1 #{board_hash_lines(1).chomp}
      0 #{board_hash_lines(0).chomp}
        0 1 2 3 4 5 6 7
    BOARD
  end

  # rubocop:disable Naming/MethodParameterName
  def board_hash_lines(row, b = @board)
    <<~LINES
      #{b[[0, row]]} #{b[[1, row]]} #{b[[2, row]]} #{b[[3, row]]} #{b[[4, row]]} #{b[[5, row]]} #{b[[6, row]]} #{b[[7, row]]}
    LINES
  end
  # rubocop:enable Naming/MethodParameterName
end
