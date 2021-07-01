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

  def move_piece(from, too)
    temp = @board[from]
    @board[from] = ' '
    @board[too] = temp
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
      7 #{board_line(7)}
      6 #{board_line(6)}
      5 #{board_line(5)}
      4 #{board_line(4)}
      3 #{board_line(3)}
      2 #{board_line(2)}
      1 #{board_line(1)}
      0 #{board_line(0)}
        0 1 2 3 4 5 6 7
    BOARD
  end

  # rubocop:disable Naming/MethodParameterName
  def board_line(n, b = @board)
    "#{b[[0, n]]} #{b[[1, n]]} #{b[[2, n]]} #{b[[3, n]]} #{b[[4, n]]} #{b[[5, n]]} #{b[[6, n]]} #{b[[7, n]]}"
  end
  # rubocop:enable Naming/MethodParameterName
end
