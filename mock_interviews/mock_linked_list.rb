# 12:25PM
#
# Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.
#
# Note: The relative order inside both the even and odd groups should remain as it was in the input. The first node is considered odd, the second node even and so on ...

# 'a' -> 'b' -> 'c' -> 'd' -> 'e' -> 'f'
# 'a' -> 'c' -> 'e' -> 'b' -> 'd' -> 'f'
#
# 'a' -> 'b' -> 'c' -> 'd' -> 'e'
#
# head = 'a'
# odd_head = 'a' -> 'c' -> 'e'
# even_head = 'b' -> 'd'
#
# 'a' -> 'c' -> 'e' -> 'b' -> 'd'

# 1,2,3,4,5,6,7
#
# 1 - 3 - 5 - 7
# 2 - 4 - 6 - nil

def odd_even_list(head)
  return head if (head.nil? || head.next.nil? || head.next.next.nil?)

  odd_head = head
  even_head = odd_head.next
  initial_even_head = even_head

  while odd_head.next && even_head.next
    odd_head.next = odd_head.next.next
    even_head.next = even_head.next.next
    odd_head = odd_head.next
    even_head = even_head.next
  end

  odd_head.next = initial_even_head

  head
end

# Feedback:
# - communication was good
# - was careful and meticulous with edge cases
# - mental model was quick
# - implementation details were challenging
