function reverseList(head) {
  if (!head || !head.next) { return head; }

  let tail = head.next;

  result = reverseList(tail);

  tail.next = head;
  head.next = null;

  return result;
}
