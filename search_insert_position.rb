# Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
#
# You may assume no duplicates in the array.
#
# Here are few examples.
# [1,3,5,6], 5 → 2
# [1,3,5,6], 2 → 1
# [1,3,5,6], 7 → 4
# [1,3,5,6], 0 → 0

# def search_insert(nums, target)
#   nums.each_with_index do |num, index|
#     return index if num >= target
#   end
#
#   nums.length
# end

# Brute force (86%)
# Space: O(1)
# Time: O(N)

def search_insert(nums, target)
  left = 0
  right = nums.size - 1

  if target < nums[left]
    return left
  elsif target > nums[right]
    return right + 1
  end

  while (left + 1 < right)
    mid = left + (right - left) / 2

    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid
    else
      right = mid
    end
  end

  if target <= nums[left]
    return left
  else
    return right
  end
end

# Binary search (92%)
# Space: O(1)
# Time: O(logN)

puts search_insert([1,3,5,6], 5)
puts search_insert([1,3,5,6], 2)
puts search_insert([1,3,5,6], 7)
puts search_insert([1,3,5,6], 0)
