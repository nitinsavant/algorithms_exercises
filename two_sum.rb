# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# Example:
# Given nums = [2, 7, 11, 15], target = 9,
#
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

def two_sum(nums, target)
  nums.each_with_index do |num1, idx1|
    nums.each_with_index do |num2, idx2|
      if (num1 + num2 == target) && (idx1 != idx2)
        return [idx1, idx2]
      end
    end
  end
end

# Space: O(1)
# Time: O(n^2)

def two_sum(nums, target)
  diff = {}

  nums.each_with_index do |num, idx|
    if diff[num]
      return [diff[num], idx]
    else
      diff[target - num] = idx
    end
  end
end

# Space: O(n) --> create hash table with n elements (worst case)
# Time: O(n) --> traverse array, n hash lookups, n hash assignments, 3 * n = O(n)

p two_sum([2, 7, 11, 15], 9)
p two_sum([3, 2, 4], 6)
