# class ListNode
#   attr_accessor :val, :next
#
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

def reverse_list(head)
  reversed = nil
  current = head

  while current
    next_node = current.next
    current.next = reversed
    reversed = current
    current = next_node
  end

  reversed
end

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)

node1.next = node2
node2.next = node3
node3.next = node4

p reverse_list(node1)
