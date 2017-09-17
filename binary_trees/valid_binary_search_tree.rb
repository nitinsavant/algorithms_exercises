# Given a binary tree, determine if it is a valid binary search tree (BST).
#
# Assume a BST is defined as follows:
#
# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and right subtrees must also be binary search trees.
# Example 1:
#     2
#    / \
#   1   3
# Binary tree [2,1,3], return true.
# Example 2:
#     1
#    / \
#   2   3
# Binary tree [1,2,3], return false.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Using recursion and carrying state

def is_valid_bst(root)
    is_valid_helper(root, -Float::INFINITY, Float::INFINITY)
end

def is_valid_helper(root, minVal, maxVal)
    return true if root.nil?

    left, right = root.left, root.right

    left_result = is_valid_helper(left, minVal, root.val)
    right_result = is_valid_helper(right, root.val, maxVal)

    left_result && right_result && root.val < maxVal && root.val > minVal

end

# Using recursive traversal

def is_valid_bst(root)
  return true if root.nil?

  result = is_valid_helper(root, [])

  max = -Float::INFINITY

  result.each do |num|
    if num <= max
      return false
    else
      max = num
    end
  end

  return true
end

def is_valid_helper(root, result)
  return result if root.nil?

  is_valid_helper(root.left, result)
  result.push(root.val)
  is_valid_helper(root.right, result)

  result
end
