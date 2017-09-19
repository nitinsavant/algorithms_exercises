# Remove all elements from a linked list of integers that have value val.
#
# Example
# Given: 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6, val = 6
# Return: 1 --> 2 --> 3 --> 4 --> 5
#
# Credits:
# Special thanks to @mithmatt for adding this problem and creating all test cases.
#
# class ListNode
#   attr_accessor :val, :next
#
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

def remove_elements(head, val)
  return head if head.nil?

  tail = head.next

  if head.val == val
    remove_elements(tail, val)    # throw away current head
  else
    head.next = remove_elements(tail, val)
    head                          # keep/return current head
  end
end


# node1 = ListNode.new(1)
# node2 = ListNode.new(2)
# node3 = ListNode.new(2)
# node4 = ListNode.new(1)
#
# node1.next = node2
# node2.next = node3
# node3.next = node4

p remove_elements(node1, 2)
