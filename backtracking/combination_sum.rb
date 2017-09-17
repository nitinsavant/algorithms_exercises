# Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
#
# The same repeated number may be chosen from C unlimited number of times.
#
# Note:
# All numbers (including target) will be positive integers.
# The solution set must not contain duplicate combinations.
# For example, given candidate set [2, 3, 6, 7] and target 7,
# A solution set is:
# [
#   [7],
#   [2, 2, 3]
# ]

# Mental Model:
# - Envision a tree with subnodes as the candidate values. Recurse into the same set of numbers until the sum of the solution equals the target
# - If the sum is great, deadend it and backtrack. Otherwise, keep recursing.

def combination_sum(candidates, target, results = [], solution = [], start = 0)
  return results << solution.clone if target == 0

  candidates.each_with_index do |num, idx|
    next if target < 0

    solution << num

    combination_sum(candidates[idx..-1], target - num, results, solution, idx)

    solution.pop
  end
  results
end

p combination_sum([2, 3, 6, 7], 7)
