require_relative 'linked_list'

linked_list = LinkedList.new

linked_list.prepend(11)
linked_list.append(13)
linked_list.prepend(10)

puts linked_list.head.data
puts linked_list.head.next_node.data
puts linked_list.tail.data