# frozen_string_literal: true

# Creates a search algorithm to determine moves
class Knight
  def initialize(board)
    @board = board
  end

  def knight_moves(start = [], finish = [])
    puts "Moves: #{start} #{finish}"
    @board.update_display(finish) { Knight.icon }
  end

  def self.icon
    '♘'
  end
end
