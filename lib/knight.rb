# frozen_string_literal: true

# Creates a search algorithm to determine moves
# rubocop:disable Metrics/ClassLength
class Knight
  attr_reader :adjacency_list

  def initialize(board_array)
    @adjacency_list = build_adjacency_list(board_array)
  end

  # Return array of moves from 'start' to 'finish'
  # rubocop:disable Metrics/MethodLength
  def knight_moves(start, finish)
    # @moves.each do |node|
    #   start_node = node if node.grid == start
    #   finish_node = node if node.grid == finish
    # end
    # move_array = knight_move_rec([start_node], finish_node)
    # print_array = move_array.each_with_object([]) { |move, a| a << move.grid }
    # puts '---'
    # print_array.each_with_index { |grid, ind| puts "GRID #{ind}: #{grid}" }
    move_array = start_to_finish(start, finish.clone)
    puts "You made it in #{move_array.length - 1} moves! Here's your path:"
    move_array.each do |move|
      print "#{move}\n"
    end
  end
  # rubocop:enable Metrics/MethodLength

  def self.icon
    '♘'
  end

  def to_s
    Knight.icon
  end

  private

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

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def moves(queue)
    search = @adjacency_list.clone
    search.each { |key, _value| search[key] = nil }
    search[queue[0]] = [0, nil]
    # distance = 0
    # origin = nil
    # count = 0
    # puts search
    # added = 0
    # search.each { |key| print "Key #{added += 1}: #{key}\n" }
    # until queue[count].nil?
    # end
    # print queue, ' ', queue.length, "\n"
    # until queue.nil?
    loop do
      node = queue.shift
      break if node.nil?

      # origin = search[node][1]
      # begin
      #   distance = search[origin][0] + 1
      # rescue
      #   distance = 0
      # else
      #   distance = search[origin][0] + 1
      # end
      # distance = search[origin][0] + 1 unless origin.nil?
      # queue += @adjacency_list[node]
      # queue.uniq!
      origin = search[node][1]
      distance = (origin.nil? ? 0 : search[origin][0] + 1)
      add = @adjacency_list[node].each_with_object([]) do |grid, array|
        array << grid if search[grid].nil?
      end
      queue += add
      queue.each do |grid|
        # distance = search[origin][0] + 1 unless origin.nil?
        search[grid] = [distance + 1, node] if search[grid].nil?
      end
      # distance += 1
      # distance = search[origin][0] + 1 unless search[origin].nil?
      # print origin, "\n"
      # print distance, "\n"
      # gets
      # count += 1
      # if count.zero?
      #   distance += 1
      #   origin = Array.new(node)
      #   count = add_array.length
      # end
      # count -= 1
      # print "Node:  #{node}\n"
      # print "Queue: #{queue}\n"
      # gets
      # count += 1
      # print queue, "\n"
      # gets
    end
    # added = 0
    # search.each { |key| print "Key #{added += 1}: #{key}\n" }
    # for value in (0..10) do
    #   search.each { |key| print "Distance #{value}: #{key}\n" if key[1][0] == value}
    # end
    search
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity
  def old_moves(queue, _finish)
    search = {}
    distance = 0
    origin = nil
    count = 0
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
      # gets
    end
    added = 0
    search.each { |key| print "Key #{added += 1}: #{key}\n" }
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
# rubocop:enable Metrics/ClassLength
