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

search_insert([2, 7, 8, 9, 10], 9)
