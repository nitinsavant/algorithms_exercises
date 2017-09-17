# Mental Model:
# - In permutations1, we were able to compare the current node with the values in the current soluion. If the current node was already in the current solution, we skip it. This won't work because the input could have duplicate values in it. So instead, we can use the index to track if we're using the same value rather than the actual value. 
# - We cant use the idx + 1 solution to just recurse into a subarray like in past problems, because we might need to go to a previous index.
# - In this problem, we just cant visit the same index that we visited previously in the tree traversal. So we can store the indices that  we visited and skip an index if it's been visited before.
# -


def permute_unique(nums, solution = [], results = [], visited_indices = {}, found = {}, start = 0)

  # if solution.size == nums.size && !found[solution]
  #   found[solution] = 1
  #   return results << solution.clone
  # end

  return results << solution.clone if solution.size == nums.size

  (0...nums.length).each do |idx|
    next if nums[idx] == nums[idx - 1] && idx != start

    next if visited_indices[idx]
    visited_indices[idx] = 1
    solution << nums[idx]

    permute_unique(nums, solution, results, visited_indices, found, idx + 1)

    visited_indices.delete(idx)
    solution.pop
  end
  results
end

p permute_unique([1, 1, 2])
