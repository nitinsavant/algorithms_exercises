# Find the maximum number in an arr of numbers. Return that number.

# Problem:
# - Input: array of numbers
# - Output: number
# - find largest number in the array and return it
#
# Algorithm:
# - Quicksort. Sort would cost O(logN). Binary search would cost O(logN)
# - Linear solution
# - Recursive solution

# Recursive:
# max([1, 2, 3]) --> max( max([1, 2]) , 3)
#
#
# - Base case: 1 element array, return element
# - 2 element array, return larger element

# def max_value(array)
#   array = array.sort
#   array[-1]
# end

# def max_value(array)
#   max = 0
#
#   return nil if array.length == 0
#
#   array.each do |num|
#     max = num if num > max
#   end
#
#   max
# end

# def max_value(arr)
#   return arr[0] if arr.length == 1
#
#   if arr[0] > arr[1]
#     max_value(arr[0] + arr[2..-1])
#   else
#     max_value(arr[1..-1])
#   end
#
# end

def max_value(arr)
  return arr[0] if arr.size <= 1

  local_max = arr[0] > arr[1] ? arr[0] : arr[1]

  max_value([local_max] + arr[2..-1])
end

# def find_max(left, right, arr)
#   if (arr.size <= 2)
#     return arr.max
#   end
#
#   mid = (left + right) / 2
#   return [find_max(left, mid - 1, arr), find_max(mid + 1, right, arr)].max
# end

puts max_value([1, 2, 3])
puts max_value([0])
puts max_value([])
puts max_value([100, 83, -5, 1, 2, 3])
