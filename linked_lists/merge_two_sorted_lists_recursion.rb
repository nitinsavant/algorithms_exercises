# Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

def merge_two_lists(head1, head2)
  return head1 if head2.nil?
  return head2 if head1.nil?

  if head1.val < head2.val
    head1.next = merge_two_lists(head1.next, head2)
    return head1
  else
    head2.next = merge_two_lists(head1, head2.next)
    return head2
  end
end
