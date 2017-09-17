# class ListNode
#   attr_accessor :val, :next
#
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

def delete_duplicates(head)
  return nil if head.nil?

  current = head

  while current.next
    if current.next.val == current.val
      current.next = current.next.next
    else
      current = current.next
    end
  end

  head
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
