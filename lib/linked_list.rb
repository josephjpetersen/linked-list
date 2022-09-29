# frozen_string_literal: true

require_relative 'node'

# This class instantiates a linked list
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def create_node(data = nil, next_node = nil)
    Node.new(data, next_node)
  end

  def append(data)
    return begin_list(data) if @head.nil?

    tail.next_node = create_node(data)
  end

  def prepend(data)
    return begin_list(data) if head.nil?

    swap_head(data)
  end

  def tail(node = @head)
    return node if last_node?(node)

    tail(node.next_node)
  end

  def begin_list(data)
    @head = create_node(data)
  end

  def swap_head(data)
    @head = create_node(data, @head)
  end

  def last_node?(node)
    return true if node.next_node.nil?

    false
  end

  private

  # Private class for Node objects in the linked list
  class Node
    attr_accessor :data, :next_node

    def initialize(data = nil, next_node = nil)
      @data = data
      @next_node = next_node
    end
  end
end
