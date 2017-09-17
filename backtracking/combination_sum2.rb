def combination_sum2(candidates, target)
  candidates.sort!
  results = []
  combination_sum2_helper(candidates, target, results)
  results
end

def combination_sum2_helper(candidates, target, results, solution = [], start = 0)
  return results << solution.clone if target == 0
  return if target < 0

  (start...candidates.length).each do |idx|
    num = candidates[idx]
    next if candidates[idx - 1] == num && idx != start

    solution << num

    combination_sum2_helper(candidates, target - candidates[idx], results, solution, idx + 1)
    solution.pop
  end
end

p combination_sum2([10, 1, 2, 7, 6, 1, 5], 8)


# By passing the full candidates array each time and incrementing start by 1 for each recursion, that ensures that we will only use each number in C once. This is different from combination_sum_1 where we could use values in C an unlimited number of times.
# By tracking the index of the array and incrementing it on each recursion, you prevent
