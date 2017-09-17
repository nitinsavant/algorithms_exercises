# Given a collection of distinct numbers, return all possible permutations.
#
# For example,
# [1,2,3] have the following permutations:
# [
#   [1,2,3],
#   [1,3,2],
#   [2,1,3],
#   [2,3,1],
#   [3,1,2],
#   [3,2,1]
# ]

# Mental Model:
# - Build the solution as you go but only return when the solution reaches a size equal to the size of the input array
# - Since the solution must have distinct values, you can use a dead-end condition to skip values already in the current solution and back track
# - When you reach a solution thats equal to the size of the input array (youll also be at a leaf node), you add it to the results, and then pop back to the last recursive call

def permute(nums, solution = [], results = []
  return results << solution.clone if solution.size == nums.size

  nums.each do |num|
    next if solution.include?(num)

    solution << num
    permute(nums, solution, results)
    solution.pop
  end
  results
end

p permute([1, 2, 3])
