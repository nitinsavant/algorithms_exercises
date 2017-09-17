# Divide:
# - head and tail (head.next)
#
# Conquer:
# - if head.val is equal to val, recurse with tail
# - if its not equal, attach recurse(tail) to head.next

def remove_elements(head, val)
  return head if head.nil?

  tail = head.next

  if head.val == val
    remove_elements(tail, val)
  else
    head.next = remove_elements(tail, val)
    head
  end
end
