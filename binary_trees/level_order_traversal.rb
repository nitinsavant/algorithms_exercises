# Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
#
# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its level order traversal as:
# [
#   [3],
#   [9,20],
#   [15,7]
# ]

# Mental Model
# - Initialize root to queue
# - Add its children to queue
# - Process its children (by adding them to nested array)
# - Add their children to the queue

def level_order(root)
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

  return result
end
