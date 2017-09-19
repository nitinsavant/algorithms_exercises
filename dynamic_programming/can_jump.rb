# My Mental Model:
# - When starting at the first spot with a value of n, we can jump to n different spots. And each is a subproblem because if we can jump to the end from any of those spots, then our initial spot can also make it to the end.
# - So the number of recursions is determined by the value at an array index (or spot). And if any of those values are false, we return false.
# Base cases:
# - If you reach the end of the array or gone past it, you've made it (true)
# - If you're not at the end of an array and hit a 0, you can't move (false)

def can_jump(nums, start = 0, memo = {})
  if start >= nums.length - 1 # reached or jumped past last element
    return memo[start] = true
  end
  if nums[start] == 0 || memo[start] == false # land on space with no jumps possible
    return memo[start] = false
  end

  jump = nums[start]
  result = false

  while jump > 0
    result ||= can_jump(nums, start + jump, memo)

    memo[start + jump] = result
    return true if memo[start + jump]

    jump -= 1
  end

  false
end

# Kevins Mental Model:
# - To determine if you can reach the last element, you must find at least one prior element that can reach the last element AND that element also has to be able to be reached from a prior element.
# - So given an element, we iterate from the beginning of the array to one before the given element.
# - If the value at that iterated element is greater than or equal to the distance between the iterated element and the last element, then we know the last element can be reached from it.
# - In addition, to return true we also must confirm that the iterated element can be reached from somewhere before it, so we call the function recursively on the iterated element.

## RECURSIVE
def can_jump(nums)
  can_jump_helper(nums, nums.size - 1, {0 => true})
end

def can_jump_helper(nums, current_index, memo)
  return memo[current_index] if memo[current_index] == false || memo[current_index] == true

  jump = current_index - 1

  while jump >= 0
    unless nums[jump] >= current_index - jump
        memo[jump] = false
        jump -= 1
        next
    end

    if can_jump_helper(nums, jump, memo)
      memo[current_index] = true
      return true
    end

    memo[jump] = false
    jump -= 1
  end

  memo[current_index] = false
end

## ITERATIVE
def can_jump(nums)
  n = nums.size
  dp = [true]

  (1..(n - 1)).each do |i|
    (0...i).each do |j|
      next if dp[i]
      dp[i] = dp[j] && nums[j] >= i - j
    end
  end
  dp[n-1]
end

can_jump([2, 0, 0])
