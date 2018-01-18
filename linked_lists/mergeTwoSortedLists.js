var mergeTwoLists = function(l1, l2) {
  if (!l2) {
    return l1;
  } else if (!l1) {
    return l2;
  }

  let dummy = new ListNode(null);
  let prev = dummy;

  while (l1 && l2) {
    if (l1.val <= l2.val) {
      prev.next = l1;
      l1 = l1.next;
    } else {
      prev.next = l2;
      l2 = l2.next;
    }
    prev = prev.next;
  }

  if (!l1) {
    prev.next = l2;
  } else if (!l2) {
    prev.next = l1;
  }

  return dummy.next;
}
