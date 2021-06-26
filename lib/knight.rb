# frozen_string_literal: true

# Creates a search algorithm to determine moves
# rubocop:disable Metrics/ClassLength
class Knight
  attr_reader :moves, :adjacency_list

  # Should root node be where the knight is on the board...?
  def initialize(board_array)
    @moves = construct_move_graph(board_array)
    @adjacency_list = build_adjacency_list(board_array)
  end

  # Print/show series of moves from 'start' to 'finish'
  def knight_moves(start, finish, start_node = nil, finish_node = nil)
    @moves.each do |node|
      start_node = node if node.grid == start
      finish_node = node if node.grid == finish
    end
    move_array = knight_move_rec([start_node], finish_node)
    print_array = move_array.each_with_object([]) { |move, a| a << move.grid }
    puts '---'
    print_array.each_with_index { |grid, ind| puts "GRID #{ind}: #{grid}" }
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

  def knight_move_rec(queue, finish, index = 0)
    return if index == 64
    return queue if queue[index].grid == finish.grid

    move_queue(queue, queue[index])
    knight_move_rec(queue, finish, index + 1)
    queue
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def move_queue(queue, node)
    queue << node.l2u1 unless node.l2u1.nil? || queue.any?(node.l2u1)
    queue << node.l2d1 unless node.l2d1.nil? || queue.any?(node.l2d1)
    queue << node.l1u2 unless node.l1u2.nil? || queue.any?(node.l1u2)
    queue << node.l1d2 unless node.l1d2.nil? || queue.any?(node.l1d2)
    queue << node.r1u2 unless node.r1u2.nil? || queue.any?(node.r1u2)
    queue << node.r1d2 unless node.r1d2.nil? || queue.any?(node.r1d2)
    queue << node.r2u1 unless node.r2u1.nil? || queue.any?(node.r2u1)
    queue << node.r2d1 unless node.r2d1.nil? || queue.any?(node.r2d1)
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  #############
  # MOVES END #
  #############

  ###################################
  # BUILD ADJACENCY LIST - NO NODES #
  ###################################

  def build_adjacency_list(board_array)
    board_array.each_with_object({}) do |vertex, hash|
      hash[vertex] = array_of_adjaceny(vertex)
    end
  end

  def array_of_adjaceny(vertex)
    vertex_moves.each_with_object([]) do |move, array|
      add_edge = make_moves(vertex, move)
      array << add_edge unless add_edge.nil?
    end
  end

  def make_moves(vertex, move)
    first = vertex[0] + move[0]
    second = vertex[1] + move[1]
    return nil if first.negative? || first > 7
    return nil if second.negative? || second > 7

    [first, second]
  end

  def vertex_moves
    [
      [-2, 1],
      [-2, -1],
      [-1, 2],
      [-1, -2],
      [1, 2],
      [1, -2],
      [2, 1],
      [2, -1]
    ]
  end

  ######################
  # ADJACENCY LIST END #
  ######################

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
# rubocop:enable Metrics/ClassLength
