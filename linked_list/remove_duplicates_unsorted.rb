# Write code to remove duplicates from an unsorted linked list.
#
#
def remove_duplicates_unsorted(head)
  dups = {}

  prev = LinkedNode.new(nil)
  prev.next = head
  current = head

  while current
    if dups.include?(current.val)
      prev.next = current.next
    else
      dups[current.val] = true
      prev = prev.next
    end
  end

  head
end
