# frozen_string_literal: true

# Creates a search algorithm to determine moves
class Knight
  attr_reader :moves

  def initialize(board_array)
    @moves = construct_move_graph(board_array)
  end

  # Print/show series of moves from 'start' to 'finish'
  def knight_moves(start = [], finish = [])
    puts "Moves: #{start} #{finish}"
  end

  def self.icon
    '♘'
  end

  def to_s
    Knight.icon
  end

  private

  # TODO: overly complex? Do with recursion?...think more
  def construct_move_graph(board_array)
    grid_nodes = board_array.each_with_object([]) do |grid, nodes|
      nodes << KnightNode.new(grid)
    end
    assign_node_directions(grid_nodes)
  end

  # Better way than 8 match calls...
  # Array of [l2u1 l2d1] etc? then .each them for each node?
  def assign_node_directions(grid_nodes)
    grid_nodes.each do |node|
      match = ref_match(node, -2, 1)
      node.l2u1 = node_ref(grid_nodes, match)
      match = ref_match(node, 1, 2)
      node.r1u2 = node_ref(grid_nodes, match)
    end
    grid_nodes[0]
  end

  # Move grid deconstuct out/up...?
  def ref_match(node, l_r, u_d)
    first = node.grid[0] + l_r
    second = node.grid[1] + u_d
    return nil if first.negative? || second.negative?
    return nil if first > 7 || second > 7

    [first, second]
  end

  def node_ref(grid_nodes, match)
    return nil if match.nil?

    grid_nodes.each do |ref|
      return ref if ref.grid == match
    end
  end

  def graph_recursive(board); end
end

# first digit = left/right, second digit = up/down
class KnightNode
  attr_reader :grid
  attr_accessor :l2u1, :l2d1, :l1u2, :l1d2, :r1u2, :r1d2, :r2u1, :r2d1

  def initialize(grid)
    @grid = grid
  end
end
