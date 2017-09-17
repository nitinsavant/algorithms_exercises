# Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.
#
# Your algorithm's runtime complexity must be in the order of O(log n).
#
# If the target is not found in the array, return [-1, -1].
#
# For example,
# Given [5, 7, 7, 8, 8, 10] and target value 8,
# return [3, 4].

# Problem:
# - Input: array of sorted integers; target value
# - Output: start and end indices of a target value
#
# Algorithm:
# - binary search recursion

def search_range(arr, target)
  leftmost = find_start_helper(arr, 0, arr.length - 1, target)
  rightmost = find_end_helper(arr, 0, arr.length - 1, target)

  [leftmost, rightmost]
end

def find_start_helper(arr, left, right, target)

  if left + 1 >= right
    if arr[left] == target
      return left
    elsif arr[right] == target
      return right
    else
      return -1
    end
  end

  mid = left + (right - left) / 2

  if arr[mid] >= target
    find_start_helper(arr, left, mid, target)
  else
    find_start_helper(arr, mid, right, target)
  end
end

def find_end_helper(arr, left, right, target)

  if left + 1 >= right
    if arr[left] == target
      return left
    elsif arr[right] == target
      return right
    else
      return -1
    end
  end

  mid = left + (right - left) / 2

  if arr[mid] <= target
    find_end_helper(arr, mid, right, target)
  else
    find_end_helper(arr, left, mid, target)
  end
end

p search_range([5, 7, 7, 8, 8, 10], 8) # [3, 4]
p search_range([5, 7, 8, 8, 8, 10], 8) # [2, 4]
p search_range([5, 7, 8, 8, 8, 10], 0) # [-1, -1]
