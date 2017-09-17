# Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
#
# For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
# the contiguous subarray [4,-1,2,1] has the largest sum = 6.

# Requirements:
# - Input: array
# - Output: subarray
#
# Algorithm:
# - Find all the subarrays
# - Find the subarray with the max sum
# - Return that sum

def max_sub_array(arr)
  current_sum = arr[0]
  max_sum = current_sum

  arr[1..-1].each do |num|
    current_sum = [num, current_sum + num].max
    max_sum = [max_sum, current_sum].max
  end

  return max_sum
end

def max_sub_array(arr, idx = 0)
  max_sub_array(arr, idx + 1)
end

p max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4]) # [4, -1, 2, 1]
