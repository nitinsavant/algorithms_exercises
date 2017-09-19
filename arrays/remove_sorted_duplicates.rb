# Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
#
# Do not allocate extra space for another array, you must do this in place with constant memory.
#
# For example,
# Given input array nums = [1,1,2],
#
# Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.

# def remove_duplicates(nums)
#   return 1 if nums.length == 1
#
#   seen = {}
#   index = 0
#
#   while (index < nums.length)
#     if (seen[nums[index]])
#       nums.delete_at(index)
#     else
#       seen[nums[index]] = true
#       index += 1
#     end
#   end
#
#   nums.length
# end


# Space: created hash with worst case n elements --> O(n)
# Time: n comparisons, n lookups, n deletions --> O(n^2)

def remove_duplicates(nums)
  i = 0
  j = 1

  while j < nums.length
    if nums[i] == nums[j]
      nums.delete_at(j)
    else
      i += 1
      j += 1
    end
  end

  nums.length
end

# Space: no hash --> O(1)
# Time: n comparisons, n lookups, n comparisons, n deletions --> O(n^2)

# "Sliding window" approach

def remove_duplicates(nums)
  return 0 if nums.length == 0
  write = 0
  read = 1

  while read < nums.length
    if nums[write] != nums[read]
      write += 1
      nums[write] = nums[read]
    end
    read += 1
  end

  write + 1
end

# Space: O(1)
# Time: O(n)

# "Read-Write" two-pointer solution.


puts remove_duplicates([1, 1, 2]); # 2
