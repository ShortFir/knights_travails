# frozen_string_literal: true

# Creates a search algorithm to determine moves
class Knight
  attr_reader :adjacency_list

  def initialize(board_array)
    @adjacency_list = build_adjacency_list(board_array)
  end

  # Return array of moves from 'start' to 'finish'
  def knight_moves(start, finish)
    # @moves.each do |node|
    #   start_node = node if node.grid == start
    #   finish_node = node if node.grid == finish
    # end
    # move_array = knight_move_rec([start_node], finish_node)
    # print_array = move_array.each_with_object([]) { |move, a| a << move.grid }
    # puts '---'
    # print_array.each_with_index { |grid, ind| puts "GRID #{ind}: #{grid}" }
    moves([start], finish)
  end

  def self.icon
    '♘'
  end

  def to_s
    Knight.icon
  end

  private

  # Knight Moves
  ##############

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity
  def moves(queue, _finish)
    search = {}
    distance = 0
    count = 0
    origin = nil
    until search.length == 64
      node = queue.shift
      # filter stuff that's alreay visited
      # queue += adjacency_list[node]
      add_array = adjacency_list[node].each_with_object([]) do |grid, array|
        array << grid unless search.key?(grid) || queue.any?(grid)
      end
      add_array.uniq!
      queue += add_array
      queue.uniq!
      search[node] = [distance, origin] unless search.key?(node)
      if count.zero?
        distance += 1
        origin = Array.new(node)
        count = add_array.length
      end
      count -= 1
      print "Node:  #{node}\n"
      print "Queue: #{queue}\n"
      added = 0
      search.each { |key| print "Key #{added += 1}: #{key}\n" }
      # gets
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity

  def moves_rec(queue, finish, search = {}, distance = 0)
    node = queue.shift
    return if node.nil?

    search[node] = [distance, origin]
    queue += add_to_queue(node)
    moves(queue, finish, search, distance + 1)
    # print queue, "\n"
    # print finish, "\n"
    # print node, "\n"
  end

  def add_to_queue(node)
    adjacency_list[node]
  end
  ################
  # ADJACENCY LIST
  ################

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

  # [horizontal, vertical]
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
end
