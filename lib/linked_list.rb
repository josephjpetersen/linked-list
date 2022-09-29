# frozen_string_literal: true

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

  def size(node = @head, count = 1)
    return count if last_node?(node)

    size(node.next_node, count + 1)
  end

  def at(index, node = @head, index_count = 0)
    return node if index_count == index
    return nil if last_node?(node)

    at(index, node.next_node, index_count + 1)
  end

  def pop(node = @head)
    if last_node?(node.next_node)
      popped_data = node.next_node.data
      node.next_node = nil
      return popped_data
    end

    pop(node.next_node)
  end

  def contains?(data, node = @head)
    return true if node.data == data
    return false if last_node?(node)

    contains?(data, node.next_node)
  end

  def find(data, node = @head, index = 0)
    return index if node.data == data
    return nil if last_node?(node)

    find(data, node.next_node, index + 1)
  end

  def to_s(node = @head, string = '')
    return string += "( #{node.data} ) -> nil" if last_node?(node)

    string += "( #{node.data} ) -> "
    to_s(node.next_node, string)
  end

  def insert_at(index, data, count = 0)
    return 'Index out of bounds.' if at(index).nil?
    return swap_head(data) if index.zero?

    return at(index - 1).next_node = create_node(data, at(index)) if index == count

    insert_at(index, data, count + 1)
  end

  def remove_at(index, count = 0)
    return 'Index out of bounds.' if at(index).nil?
    return @head = at(1) if index.zero?

    return at(index -1).next_node = at(index + 1) if index == count

    remove_at(index, count + 1)
  end
  
  # Subclass for Node objects in the linked list
  class Node
    attr_accessor :data, :next_node

    def initialize(data = nil, next_node = nil)
      @data = data
      @next_node = next_node
    end
  end
end
