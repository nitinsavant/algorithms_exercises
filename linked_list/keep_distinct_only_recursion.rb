# Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
#
# For example,
# Given 1->2->3->3->4->4->5, return 1->2->5.
# Given 1->1->1->2->3, return 2->3.

def delete_duplicates(head)

  list1 = head

  while list1.next
    if list1.val != list1.next.val
      list1.next = nil
    else
      list1 = list1.next
    end
  end

  end

end

# Divide:
# - first list is list of identical elements
# - second list is whatever's remaining
# - in other words, use a runner to decide where to divide the list into two

# Recurse/Combine:
# - if the size of first list is more than one, throw it away, and recurse into 2nd list
# - else, attach head to recursion of 2nd list

# Base case:
# - if the list is just one node, return the head
