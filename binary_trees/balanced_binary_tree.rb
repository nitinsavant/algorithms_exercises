# Given a binary tree, determine if it is height-balanced.
#
# For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def is_balanced(root)
  return true if root.nil?

  depth_diff = max_depth(root.left) - max_depth(root.right)

  return depth_diff.abs <= 1 && is_balanced(root.left) && is_balanced(root.right)
end

def max_depth(root)
  return 0 if root.nil?

  left_result = max_depth(root.left)
  right_result = max_depth(root.right)

  return (left_result > right_result ? left_result : right_result) + 1
end

# Top-down approach
# Time: O(N^2) -->
