# Given a sorted linked list, delete all duplicates such that each element appear only once.
#
# For example,
# Given 1->1->2, return 1->2.
# Given 1->1->2->3->3, return 1->2->3.

# class ListNode
#   attr_accessor :val, :next
#
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

def delete_duplicates(head)
  return head if head.nil? || head.next.nil?

  tail = head.next
  result = delete_duplicates(tail)

  if result.val == head.val
    result
  else
    head.next = result
    head
  end
end

# Space: O(1)
# Time: O(n)

node1 = ListNode.new(1)
node2 = ListNode.new(1)
node3 = ListNode.new(2)
node4 = ListNode.new(2)

node1.next = node2
node2.next = node3
node3.next = node4

p delete_duplicates(node1)
