# frozen_string_literal: true

# Creates a search algorithm to determine moves
class Knight
  def initialize(board_array)
    @adjacency_list = build_adjacency_list(board_array)
  end

  # TODO: Return array, so can do fancy board graphics in main
  # Print list of moves from 'start' to 'finish'
  def knight_moves(start, finish)
    move_array = start_to_finish(start, finish.clone)
    puts "You made it in #{move_array.length - 1} moves! Here's your path:"
    move_array.each do |move|
      print "#{move}\n"
    end
  end

  def self.icon
    '♘'
  end

  def to_s
    Knight.icon
  end

  private

  ##############
  # Knight Moves
  ##############

  def start_to_finish(start, move, index = 0, move_array = [])
    move_tree = moves([start])
    until move.nil?
      move_array << move
      move = move_tree[move_array[index]][1]
      index += 1
    end
    move_array.reverse
  end

  # TODO: Clean up this nonsense
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def moves(queue)
    search = @adjacency_list.clone
    search.each { |key, _value| search[key] = nil }
    search[queue[0]] = [0, nil]
    loop do
      node = queue.shift
      break if node.nil?

      origin = search[node][1]
      distance = (origin.nil? ? 0 : search[origin][0] + 1)

      add = @adjacency_list[node].each_with_object([]) do |grid, array|
        array << grid if search[grid].nil?
      end
      queue += add

      queue.each do |grid|
        search[grid] = [distance + 1, node] if search[grid].nil?
      end
    end
    search
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

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
end
