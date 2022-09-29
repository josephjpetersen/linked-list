require_relative 'linked_list'

linked_list = LinkedList.new

linked_list.prepend(15)
linked_list.prepend(8)
linked_list.append(16)
linked_list.append(23)
linked_list.append(42)

puts linked_list.to_s

linked_list.insert_at(0, 4)

puts linked_list.to_s

linked_list.append(69)

puts linked_list.to_s

linked_list.remove_at(6)

puts linked_list.to_s