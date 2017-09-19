# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
#
# For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
#
# Note:
# You must do this in-place without making a copy of the array.
# Minimize the total number of operations.

def move_zeroes(nums)
  read = 0
  write = 0

  while read < nums.length
    if nums[read] != 0
      nums[write] = nums[read]
      write += 1
    end
    read += 1
  end

  while write < nums.length
    nums[write] = 0
    write += 1
  end
end

# Space: O(1)
# Time: O(n)
