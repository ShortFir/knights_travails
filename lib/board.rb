# frozen_string_literal: true

# Chess Board
class Board
  # attr_reader :board

  def initialize
    @board = construct_board
  end

  def display
    display1
  end

  def update_display(loc = [0, 0])
    @board[loc[1]][loc[0]] = yield if block_given?
  end

  private

  def display1
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

  def construct_board
    Array.new(8) { Array.new(8) { ' ' } }
  end
end
