# Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
#
# Example 1:
# Input:
#     3
#    / \
#   9  20
#     /  \
#    15   7
# Output: [3, 14.5, 11]
# Explanation:
# The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
# Note:
# The range of node's value is in the range of 32-bit signed integer.

def average_of_levels(root)
  return [] if root.nil?
  queue = [root]
  result = []
  current_level = 0

  until queue.empty?
    result[current_level] = []

    queue.size.times do
      root = queue.shift
      result[current_level].push(root.val)
      queue.push(root.left) if root.left
      queue.push(root.right) if root.right
    end

    current_level += 1
  end

  return result.map do |arr|
    arr.reduce(:+) / arr.size.to_f
  end
end
