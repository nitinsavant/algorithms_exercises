# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.


# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def max_depth(root)
  return 0 if root.nil?

  left_result = max_depth(root.left)
  right_result = max_depth(root.right)

  return (left_result > right_result ? left_result : right_result) + 1
end
