# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
#
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
#
# Find the minimum element.
#
# You may assume no duplicate exists in the array.

def find_min(nums)
  min = nums[0]

  nums.each do |num|
    min = num if num < min
  end

  min
end

# O(N) solution

def find_min(nums)
  left = 0
  right = nums.length - 1

  return nums[left] if nums[left] < nums[right]

  while (left + 1 < right)
    mid = left + (right - left) / 2

    if nums[mid] > nums[right]
      left = mid
    else
      right = mid
    end

  end

  if nums[left] < nums[right]
    nums[left]
  else
    nums[right]
  end
end

# O(logN) soluion (75%)

p find_min([4, 5, 6, 7, 0, 1, 2])
p find_min([4, 5, 6, 7, 8, 9, 10])
p find_min([0, 1, 2, 4, 5, 6, 7])
p find_min([9, 10, 2, 4, 5, 6, 7])
p find_min([2, 3, 1])
