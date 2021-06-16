# frozen_string_literal: true

# Creates a search algorithm to determine moves
class Knight
  attr_reader :moves

  # Should root node be where the knight is on the board...?
  def initialize(board_array)
    @moves = construct_move_graph(board_array)
  end

  # Print/show series of moves from 'start' to 'finish'
  def knight_moves(start = [], finish = [], start_node = nil)
    puts "Moves: #{start} #{finish}"
    @moves.each { |node| start_node = node if node.grid == start }
    puts "Start Node: #{start_node.grid}" unless start_node.nil?
  end

  def self.icon
    '♘'
  end

  def to_s
    Knight.icon
  end

  private

  #########
  # MOVES #
  #########

  #############
  # MOVES END #
  #############

  ###############
  # BUILD GRAPH #
  ###############

  # TODO: overly complex? Do with recursion?...
  def construct_move_graph(board_array)
    grid_nodes = board_array.each_with_object([]) do |grid, nodes|
      nodes << KnightNode.new(grid)
    end
    assign_node_directions(grid_nodes)
  end

  def assign_node_directions(grid_nodes)
    grid_nodes.each do |node|
      node.instance_variables[1..-1].each do |var|
        node.instance_variable_set(var, match_to_node(grid_nodes, node, var))
      end
    end
    grid_nodes
  end

  def match_to_node(grid_nodes, match_node, var)
    grid_nodes.each do |node|
      return node if node.grid == convert_to_grid(match_node, var)
    end
    nil
  end

  def convert_to_grid(node, var)
    coord = return_coord(var)
    first = node.grid[0] + coord[0]
    second = node.grid[1] + coord[1]
    return nil if first.negative? || first > 7
    return nil if second.negative? || second > 7

    [first, second]
  end

  def return_coord(var)
    {
      :@l2u1 => [-2, 1],
      :@l2d1 => [-2, -1],
      :@l1u2 => [-1, 2],
      :@l1d2 => [-1, -2],
      :@r1u2 => [1, 2],
      :@r1d2 => [1, -2],
      :@r2u1 => [2, 1],
      :@r2d1 => [2, -1]
    }[var]
  end
  ###################
  # BUILD GRAPH END #
  ###################
end

# first digit = left/right, second digit = up/down
class KnightNode
  attr_reader :grid
  attr_accessor :l2u1, :l2d1, :l1u2, :l1d2, :r1u2, :r1d2, :r2u1, :r2d1

  def initialize(grid)
    @grid = grid
    @l2u1 = nil
    @l2d1 = nil
    @l1u2 = nil
    @l1d2 = nil
    @r1u2 = nil
    @r1d2 = nil
    @r2u1 = nil
    @r2d1 = nil
  end
end
