var reverseBetween = function(head, m, n) {
  if (!head || m===n) {return head;}

  let dummy = new ListNode(0);
  dummy.next = head;
  let prev = dummy;
  let nodeBeforeReverse = dummy;

  for (let i = 0; i < m; i++) {
    nodeBeforeReverse = prev;
    prev = prev.next;
  }

  let lastRevNode = prev;
  let current = prev.next;
  let next;

  for (let i = m; i < n; i++) {
    next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }

  nodeBeforeReverse.next = prev;
  lastRevNode.next = current;

  return dummy.next;
}
