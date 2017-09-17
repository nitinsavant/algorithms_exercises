# class ListNode
#   attr_accessor :val, :next
#
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

def remove_elements(head, val)
  return nil if head.nil?

  dummy = ListNode.new(nil)
  dummy.next = head
  current = dummy

  while current.next
    if current.next.val == val
      current.next = current.next.next
    else
      current = current.next
    end
  end

  dummy.next
end

# Space: O(1)
# Time: O(n)

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(2)
node4 = ListNode.new(1)

node1.next = node2
node2.next = node3
node3.next = node4

p remove_elements(node1, 2)
