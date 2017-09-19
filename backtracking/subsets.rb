# Given a set of distinct integers, nums, return all possible subsets.
#
# Note: The solution set must not contain duplicate subsets.
#
# For example,
# If nums = [1,2,3], a solution is:
#
# [
#   [3],
#   [1],
#   [2],
#   [1,2,3],
#   [1,3],
#   [2,3],
#   [1,2],
#   []
# ]

# Mental Model:
# Using the start index prevents 2 things. It prevents duping values so [1, 1, 1] isn't considered a subset. It also prevents duping solutions so [1, 2, 3] and [3, 2, 1] aren't both added to the result.

def subsets(nums, solution = [], results = [], start = 0)
  results << solution.clone

  (start...nums.length).each do |idx|

    solution << nums[idx]
    subsets(nums, solution, results, idx + 1)
    solution.pop
  end
  results
end


p subsets([1, 2, 3])
