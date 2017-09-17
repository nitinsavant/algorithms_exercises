# Given a binary tree, flatten it to a linked list in-place.
#
# For example,
# Given
#
#          1
#         / \
#        2   5
#       / \   \
#      3   4   6
# The flattened tree should look like:
#    1
#     \
#      2
#       \
#        3
#         \
#          4
#           \
#            5
#             \
#              6

# Mental Model
# - Preorder traverse the binary tree and store nodes in a queue
# - Process the queue and attach each node to the right of the root node, while setting the left node to nil. Loop while assigning to create a linked list structure.

def flatten(root)
  return if root.nil? || (!root.left && !root.right)

  stack = [root]
  preorder_queue = []

  while !stack.empty?
    current = stack.pop
    preorder_queue.push(current)
    stack.push(current.right) if current.right
    stack.push(current.left) if current.left
  end

  preorder_queue.shift

  while !preorder_queue.empty?
    current = preorder_queue.shift
    root.left = nil
    root.right = current
    root = root.right
  end
end

# DNC recursion method

def flatten(root)
  return nil if root.nil?
  return root if !root.left && !root.right

  left, right = root.left, root.right

  left_result = flatten(left)
  right_result = flatten(right)

  leaf = left_result

  while leaf && leaf.right
    leaf = leaf.right
  end

  if left_result
    root.right = left_result
    leaf.right = right_result
  else
    root.right = right_result
  end

  root.left = nil

  root
end

def flatten(root)


end










# JS solution with postorder traversal

var flatten = function(root) {
  flattenHelper(root, {previousNode: null})
};

var flattenHelper = function(root, storage) {
  if (root === null) { return; }

    flattenHelper(root.right, storage);
    flattenHelper(root.left, storage);

    root.right = storage.previousNode;
    root.left = null;
    storage.previousNode = root;
};
