function reverseList(head) {
  if (!head || !head.next) {
    return head;
  }

  let current = head;
  let reversed = null;

  while (current) {
    let temp = current.next;
    current.next = reversed;
    reversed = current;
    current = temp;
  }

  return reversed;
}
