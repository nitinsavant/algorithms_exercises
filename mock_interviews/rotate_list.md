Rotate List
------------

Given a list, rotate the list to the right by k places, where k is non-negative.

- 2-pointer slide
- Move the 2nd pointer k spaces ahead
- Move both pointers together until the 2nd pointer reaches the end of the list. The 1st pointer will be at the correct place.
- Use the original head and the 1st pointer as your 2 lists.
- Concatenate both lists.
- Keep a reference to the end of the 1st list in order to assign it's next value to nil
- Point the end of the 2nd list to your original head

Special cases:
- what if k is longer than length of the list?
- get length of list and do a remainder of k to the length of the list
- if k == 12, 12%5 = 2, use 2.

Feedback:
- Started at 12:40, End at 1:25.
- very good flushing out the requirements and asking questions
- good attempt to think about recursion and explaining why it's not a great approach
- liked that you thought of the subproblem. your pseudocode was very well thought through and written out.
- i didn't really care that we ran out of time for the special case of k greater than the length of the list.
- fluent in JS. it's all really mental models and edge cases for us now.
- really liked how you renamed variables to be more semantic to make it easier to reason about your next subproblem
- "appended to" - confusing use of the term. sometimes you meant prepend, i think.

Myself:
- mental model was strong
- didn't write detailed enough pseudocode
- so i ran into several tiny problems while coding. i could have worked out those details with pseudocode.

Tiffany:
- amazing at pseudocode, thinks through all the details really well, really good at naming and renaming variables between subproblems to make it easier to talk through the code

<!-- // Given a list, rotate the list to the right by k places, where k is non-negative.

// 1=>2=>3=>4=>5=>6=>null
// k=0,6
// anchor = 4
// anchor.next = 5, newHead
// runner = 6, => originalHead
// runner.next = null

// 5=>6=>1=>2=>3=>4=>null

// 1=>2=>3=>4=>null
// 5=>6=>

// 6=>1=>2=>3=>4=>5
// k=1,7

// 5=>6=>1=>2=>3=>4
// k=2,8

// 4=>5=>6=>1=>2=>3
// k=3,9

// 3=>4=>5=>6=>1=>2
// k=4,10

// 2=>3=>4=>5=>6=>1
// k=5,11

// k % length / # of nodes in LL
// 6%6=0
// 7%6=1

// sub-problem
// how do you find k nodes from the end of the list?
//   anchor initialized at first node
//   runner initialized at (first node + k) node

//   increment both anchor and runner by 1
//   stop when runner.next is null (or runner is last node)
//   *now my anchor.next is at k from the end of the list
      // (and anchor is the new last node)

// rotation
//   runner.next = original head
//   anchor.next = null

// return new head (anchor.next/ k from end)

// 1=>2=>3=>4=>5=>6=>null

// 1=>2=>3=>4=>5=>6=>null
// k=0
// anchor = 4
// anchor.next = 5, newHead
// runner = 6, => originalHead
// runner.next = null

function getLength(head) {
  var count = 0;
  var current = head;

  while (current) {
    count++;
    current = current.next;
  }

  return count;
}

function rotateRight(head, k) {
  if (!head) return null;

  var anchor = head;
  var runner = head;
  var length = getLength(head);

  k = k % length;

  if (!k) return head;

  for (var i = 0; i < k; i++) {
    runner = runner.next;
  }

  while (runner.next) {
    anchor = anchor.next;
    runner = runner.next;
  }

  var originalHead       = head;
  var newHead            = anchor.next;
  var newTail            = anchor;
  var prependToOriginal  = runner;

  prependToOriginal.next = originalHead;
  newTail.next           = null;

  return newHead;
} -->
