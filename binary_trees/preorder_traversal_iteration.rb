# Given a binary tree, return the preorder traversal of its nodes' values.
#
# For example:
# Given binary tree {1,#,2,3},
#    1
#     \
#      2
#     /
#    3
# return [1,2,3].
#
# Note: Recursive solution is trivial, could you do it iteratively?

# Mental Model:
# - Initialize stack to root and empty result array
# - Pop node from stack
# - Add root.right if it exists
# - Add root.left if it exists
# - Push root.val to array
# - Loop through all these steps until stack is empty
# - Return result



def preorder_traversal(root)
  return [] if root.nil?

  result, stack = [], [root]

  while !stack.empty?
    root = stack.pop
    stack.push(root.right) if root.right
    stack.push(root.left) if root.left
    result.push(root.val)
  end

  result
end
