var mergeTwoLists = function(l1, l2) {
  if (!l1) {
    return l2;
  } else if (!l2) {
    return l1;
  }

  let head;

  if (l1.val <= l2.val) {
    head = l1;
    l1 = l1.next;
  } else {
    head = l2;
    l2 = l2.next;
  }

  head.next = mergeTwoLists(l1, l2);
  return head;
}
