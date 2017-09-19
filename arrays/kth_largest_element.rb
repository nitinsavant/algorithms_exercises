# Note: The right_idx is messed up in this solution. Ideally, I could assign a default parameter of `right_idx = nums.length - 1` but that's not possible with Ruby. THerefore, there are some ugly hacks to make this solution works, mostly +1s that don't make sense. 

def partition(nums, left_idx = 0, right_idx = nums.length)
  pivot = right_idx - 1
  read = left_idx
  write = read

  while read < pivot
    if nums[read] <= nums[pivot]
      nums[read], nums[write] = nums[write], nums[read]
      write += 1
    end
    read += 1
  end

  nums[write], nums[pivot] = nums[pivot], nums[write]

  write
end

def find_kth_largest(nums, k, left_idx = 0, right_idx = nums.length)
  return nums[0] if right_idx - left_idx + 1 <= 1

  pivot = partition(nums, left_idx, right_idx)
  kth_index = nums.length - k

  if kth_index == pivot
    return nums[pivot]
  elsif kth_index > pivot
    find_kth_largest(nums, k, pivot + 1, right_idx)
  else
    find_kth_largest(nums, k, left_idx, pivot)
  end
end

nums = [3, 2, 1, 5, 6, 4]
p find_kth_largest(nums, 2)
