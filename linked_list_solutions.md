Remove Linked List Elements
---------------------------

Remove all elements from a linked list of integers that have value **val**.

Mental Model (Iteration):
- Traverse the linked list.
- Check the value of the next node.
- If it matches, change the current.next to be the next.next
- Stop traversing when current is nil

Special Cases:
- If the initial head's value needs to be removed, we need a special loop to remove it until we reach a head that doesn't need to be removed.

```ruby
def remove_elements(head, val)
  # Remove matches from initial head of list
  while head && head.val == val
    head = head.next
  end

  return head if head.nil?
  current = head

  while current.next
    # Remove all other values
    if current.next.val == val
      current.next = current.next.next
    else
      current = current.next
    end
  end

  head
end
```

Mental Model (Recursion):
- Split into head and tail
- If the head is equal to the value, then don't combine with tail
- Otherwise, set head.next = recursion of tail

```ruby
def remove_elements(head, val)
  return head if head.nil?

  tail = head.next

  tail_result = remove_elements(tail, val)

  if head.val == val
    return tail_result
  else
    head.next = tail_result
    return head
  end
end
```

Remove Duplicates from Sorted List
-----------------------------------

Given a sorted linked list, delete all duplicates such that each element appear only once.

Mental Model (Traversal):
- Traverse the list until you reach the end (i.e. current.next == nil)
- If the next node's value equals the current node, assign the current node's next value to the next-next node
- Only increment if you didn't remove a dupe

```ruby
def delete_duplicates(head)
  return head if head.nil?

  current = head

  while current.next
    if current.val == current.next.val
      current.next = current.next.next
    else
      current = current.next
    end
  end

  head
end
```

Mental Model (Recursion):
- Split into head and tail
- If the head and tail values are equal, then you can throw away head and just recurse into tail
- Otherwise, set attach recursion of tail onto head and return head

```ruby
def delete_duplicates(head)
  return head if head.nil?

  tail = head.next

  if tail.val == head.val
    delete_duplicates(tail)
  else
    head.next = delete_duplicates(tail)
    head
  end
end
```

Reverse Linked List
-------------------

Reverse a singly linked list

Mental Model (Traversal):
- While traversing, change the current node's next pointer to point to the previous element (initialized to nil).
- Since you're changing current node's next value, we must store that next node prior to that in order to continue traversing.
- To set up the next iteration,  we must shift both prev and current to the next values, which we stored.
- The return value isn't head since that's now actually the tail.

```ruby
def reverse_list(head)
  return head if head.nil?

  current = head
  prev = nil

  while current
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
  end

  prev
end
```

Mental Model (Recursion):
- It's a different type of recursion than the previous 2 problems. Instead of directly using the result of recursion into the tail (when you only have access to that result's head), you do something different.
- You pull the head node off the tail each time and pass it to the recursion so that it attaches one by one to the dummy node, building up until it's reversed.

```ruby
def reverse_list(head, new_head = nil)
  return new_head if head.nil?

  tail = head.next
  head.next = new_head

  reverse_list(tail, head)
end
```

Merge Two Sorted Lists
-----------------------

Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

Mental Model (Recursion):
- Compare the heads of each list.
- For the list with the lesser value, set that node's next equal to the recursion of the two lists (without the lesesr value node)
- We'll need to return the head of the list that started with the lesser value
