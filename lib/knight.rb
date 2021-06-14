# frozen_string_literal: true

# Creates a search algorithm to determine moves
class Knight
  def knight_moves(start = [], finish = [])
    puts "Moves: #{start} #{finish}"
  end

  def self.icon
    '♘'
  end

  def to_s
    Knight.icon
  end
end
