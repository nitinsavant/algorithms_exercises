# Given a BST (Binary Search Tree) that may be unbalanced, convert it into a balanced BST that has minimum possible height.

# Mental Model
# - Traverse the tree inorder and store nodes in an array
# - The array should be sorted now
#
# - Find the middle of the array and set as the root
# - Find the middle of the left half and set to left
# - Find the middle of the left half and set to left

def inorder_traversal(root)
  return [] if root.nil?
  result = []
  stack = []

  while root || !stack.empty?
    while root
      stack.push(root)
      root = root.left
    end

    root = stack.pop
    result.push(root.val)
    root = root.right
  end

  result
end

def balance_bst(root)
  return root if root.nil?
  sorted_values = inorder_traversal(root)
  balance_bst_helper(sorted_values)
end

def balance_bst_helper(sorted_values)
  return if sorted_values.size == 0
  return TreeNode.new(sorted_values[0]) if sorted_values.size == 1

  midpoint = sorted_values.size / 2

  new_root = TreeNode.new(sorted_values[midpoint])

  left = sorted_values[0..midpoint - 1]
  right = sorted_values[midpoint + 1..-1]

  new_root.left = balance_bst_helper(left)
  new_root.right = balance_bst_helper(right)

  new_root
end

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
    def to_preorder_array(root = self)
      return [] unless root
      array = [root.val]
      left = to_preorder_array(root.left)
      right = to_preorder_array(root.right)
      array.concat(left).concat(right)
    end
end

# Problem 1
node1 = TreeNode.new(30)
node2 = TreeNode.new(20)
node3 = TreeNode.new(10)
node1.left = node2
node2.left = node3
puts balance_bst(node1).to_preorder_array == [20, 10, 30]
# Problem 2
node4 = TreeNode.new(4)
node5 = TreeNode.new(3)
node6 = TreeNode.new(2)
node7 = TreeNode.new(1)
node4.left = node5
node5.left = node6
node6.left = node7
puts balance_bst(node4).to_preorder_array == [2, 1, 3, 4] || balance_bst(node4).to_preorder_array == [3, 1, 2, 4] || balance_bst(node4).to_preorder_array == [3, 2, 1, 4]
# Problem 3
node_1 = TreeNode.new(1)
node_2 = TreeNode.new(2)
node_3 = TreeNode.new(3)
node_4 = TreeNode.new(4)
node_5 = TreeNode.new(5)
node_6 = TreeNode.new(6)
node_7 = TreeNode.new(7)
node_4.left = node_3
node_4.right = node_5
node_3.left = node_2
node_2.left = node_1
node_5.right = node_6
node_6.right = node_7
puts balance_bst(node_4).to_preorder_array == [4, 2, 1, 3, 6, 5, 7]
