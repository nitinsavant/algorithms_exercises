# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def add_two_numbers(l1, l2)
  head = ListNode.new(nil)
  current = head
  carry_over = 0

  while l1 && l2
    sum = l1.val + l2.val + carry_over
    if sum >= 10
      sum = sum % 10
      carry_over = 1
    else
      carry_over = 0
    end

    l1 = l1.next
    l2 = l2.next
    current.next = ListNode.new(sum)
    current = current.next
  end

  while l1
    sum = l1.val + carry_over

    if sum >= 10
      sum = sum % 10
      carry_over = 1
    else
      carry_over = 0
    end

    l1.val = sum
    current.next = l1

    current = current.next
    l1 = l1.next
  end

  while l2
    sum = l2.val + carry_over

    if sum >= 10
      sum = sum % 10
      carry_over = 1
    else
      carry_over = 0
    end

    l2.val = sum
    current.next = l2

    current = current.next
    l2 = l2.next
  end

  current.next = ListNode.new(1) if carry_over == 1

  head.next
end

l1 = ListNode.new(1)


l2 = ListNode.new(9)
l2.next = ListNode.new(9)

p add_two_numbers(l1, l2)
