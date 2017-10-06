Search Insert Position
----------------------

Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order. You may assume no duplicates in the array.

Mental Model:
- Since it's sorted, we can try the middle element first.
- If it's a match, we return its index.
- If it's greater than the target, we need to look in the left half of the array. If it's less, we need to look in the right half.
- If we ever find the target, we return its index.
- If the loop ends, that means there are 2 elements left. If the left is the target, return it. If the right is the value, return it.
- If the target is greater than the right value, then return 1 more than the right index.
- If the target is less than the left value, return the left index.
- If the target is greater than the left value but less than the right value, return the right index.

Special Cases:
- If the array is empty, return 0.

```ruby
def search_insert(nums, target)
  return 0 if nums.length == 0

  left = 0
  right = nums.length - 1

  while left + 1 < right
    mid = (left + right) / 2
    if target == nums[mid]
        return mid
    elsif target > nums[mid]
        left = mid
    else
        right = mid
    end
  end

  if target <= nums[left]
    return left
  end

  if target <= nums[right]
    return right
  end

  if target > nums[right]
    return right + 1
  end
end
```

Complexity:
- Time: O(logN) because we can throw away half the elements on each iteration. No need to traverse all elements.
- Space: O(1)

Search for a Range:
-------------------

Given an array of integers sorted in ascending order, find the starting and ending position of a given target value. Your algorithm's runtime complexity must be in the order of O(log n).

Mental Model:

















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
