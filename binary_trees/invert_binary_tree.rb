# Invert a binary tree.
#
#      4
#    /   \
#   2     7
#  / \   / \
# 1   3 6   9
# to
#      4
#    /   \
#   7     2
#  / \   / \
# 9   6 3   1

# Recursion with divide/conquer

def invert_tree(root)
  return root if root.nil?

  left, right = root.left, root.right

  root.left = invert_tree(right)
  root.right = invert_tree(left)

  root
end

# Preorder Traversal

def invert_tree(root)
  return nil if root.nil?

  # process head first
  root.left, root.right = root.right, root.left

  # process left then right
  invert_tree(root.left)
  invert_tree(root.right)

  root
end

# Level traversal using queue

def invert_tree(root)
  return root if root.nil?

  queue = [root]

  while queue.length > 0
    node = queue.shift()
    node.left, node.right = node.right, node.left
    queue.push(node.left) if node.left
    queue.push(node.right) if node.right
  end

  root
end
