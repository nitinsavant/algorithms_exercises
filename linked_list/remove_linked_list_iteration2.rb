



def remove_elements(head, val)
  return head if head.nil?

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
