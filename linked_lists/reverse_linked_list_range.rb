# Reverse a linked list from position m to n. Do it in-place and in one-pass.
#
# For example:
# Given 1->2->3->4->5->NULL, m = 2 and n = 4,
#
# return 1->4->3->2->5->NULL.
#
# Note:
# Given m, n satisfy the following condition:
# 1 ≤ m ≤ n ≤ length of list.



def reverse_between(head, m, n)
  return head if m == n

  # Find node immediately prior to reversal range
  reverse_start = head
  index = 1
  while index < m - 1
    reverse_start = reverse_start.next
    index += 1
  end

  # Find node immediately after reversal range
  reverse_end = reverse_start
  while index < n
    reverse_end = reverse_end.next
    index += 1
  end

  # Set up similar to reverse linked list (traversal)
  prev = reverse_end.next
  current = reverse_start.next

  # Reverse elements in reversal range
  count = 0
  while count <= m - n
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
    count += 1
  end

  # Attach reversed tail to head
  reverse_start.next = prev
  head
end
