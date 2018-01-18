Divide and Conquer Recursive Template
-------------------------------------

```ruby
def some problem(root)
  left, right = root.left, root.right
  left_result = some_problem(left)
  right_result = some_problem(right)

  result = combine results
  result
end
```

Max Depth
----------

Given a binary tree, find its maximum depth. The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Mental Model:
-


(height) balanced tree

same tree

validate BST

Binary Preorder Traversal

Insert a Binary Tree

Symmetric Tree

Insert a node in BST

TRAVERSAL

Binary Preorder Traversal (iterative approach with a stack)

Level Order Traversal for Binary Tree

Average Levels in a Binary Tree

Sum Root to Leaf

Convert BT into LL

Balance  BST
