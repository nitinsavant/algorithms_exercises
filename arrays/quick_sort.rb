# Note: The right_idx is messed up in this solution. Ideally, I could assign a default parameter of `right_idx = nums.length - 1` but that's not possible with Ruby. THerefore, there are some ugly hacks to make this solution works, mostly +1s that don't make sense.

def partiton(nums, left_idx = 0, right_idx = nums.length)
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

def quick_sort(nums, left_idx = 0, right_idx = nums.length)
  return if right_idx - left_idx <= 1

  pivot = partiton(nums, left_idx, right_idx)

  quick_sort(nums, left_idx, pivot)
  quick_sort(nums, pivot + 1, right_idx)
end

nums = [3, 2, 1, 5, 6, 4]
p quick_sort(nums)
p nums
