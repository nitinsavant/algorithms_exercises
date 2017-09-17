# Given a collection of integers that might contain duplicates, nums, return all possible subsets.
#
# Note: The solution set must not contain duplicate subsets.
#
# For example,
# If nums = [1,2,2], a solution is:
#
# [
#   [2],
#   [1],
#   [1,2,2],
#   [2,2],
#   [1,2],
#   []
# ]

# Mental Model:
# - To remove the possiblity of [1, 1] results, where we recurse into the same index value, we recurse into idx + 1 each time.
# - To remove the possibilty of duplicate solutions, we dont recurse if the current node is the same as the previous node that we just recursed into. To do this, we skip a recursion if the nums value is the same as the previous one on the same level of the tree (i.e. one idx prior). This requires the data to be sorted.
# - But there are times when we want to recurse into a node with the same value and thats when the node is at the next level in the tree. That's why we include idx != start because we need to include [1, 2, 2] and [2, 2] in the results.

def subsets_with_dup(nums)
  nums.sort!
  result = []
  subsets_helper(nums, result)
  result
end
 
def subsets_helper(nums, result = [], solution = [], start = 0)
  result << solution.clone

  (start...nums.length).each do |idx|
    next if nums[idx] == nums[idx - 1] && idx != start

    solution << nums[idx]
    subsets_helper(nums, result, solution, idx + 1)
    solution.pop
  end
  result
end

p subsets_with_dup([1, 2, 2])
