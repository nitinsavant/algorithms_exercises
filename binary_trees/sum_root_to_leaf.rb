# Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
#
# An example is the root-to-leaf path 1->2->3 which represents the number 123.
#
# Find the total sum of all root-to-leaf numbers.
#
# For example,
#
#     1
#    / \
#   2   3
# The root-to-leaf path 1->2 represents the number 12.
# The root-to-leaf path 1->3 represents the number 13.
#
# Return the sum = 12 + 13 = 25.

# Mental Model
# - Preorder traverse the binary tree, using the iteration with a stack approach
# - As you proceed through the tree, store elements to be processsed in the stack. Each element is actually an array containing the current node and a concatenated string of the previous nodes
# - As you process the stack, push the string to an array
# - COnvert the strings to numbers and sum them to the final result

def sum_numbers(root)
  return 0 if root.nil?

  numbers = []
  stack = [[root, '']]

  until stack.empty?
    root, path_str = stack.pop
    path_str += root.val.to_s
    if root.right || root.left
      stack.push([root.right, path_str]) if root.right
      stack.push([root.left, path_str]) if root.left
    else
      numbers.push(path_str)
    end
  end

  numbers.map(&:to_i).reduce(:+)
end
