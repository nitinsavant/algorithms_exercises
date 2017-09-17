# Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
#
# For example,
# If n = 4 and k = 2, a solution is:
#
# [
#   [2,4],
#   [3,4],
#   [2,3],
#   [1,2],
#   [1,3],
#   [1,4],
# ]

# Mental Model:
# - Envision a tree with subnodes from 1 to n. Recurse into the same set of numbers, and build a solution as you go, and only return the solution when it reaches a size of k
# - Use an index to reduce the size of each set of numbers to prevent duplicates

def combine(n, k, start = 1, solution = [], results = [])
  return results << solution.clone if solution.size == k

  (start..n).each do |num|
    solution << num
    combine(n, k, num + 1, solution, results)
    solution.pop
  end

  results
end

p combine(4, 2)
