# Given a positive integer num, write a function which returns True if num is a perfect square else False.
#
# Note: Do not use any built-in library function such as sqrt.
#
# Example 1:
#
# Input: 16
# Returns: True
# Example 2:
#
# Input: 14
# Returns: False

def is_perfect_square(num)
  left = 1
  right = num

  return true if num == 1

  while left + 1 < right
    mid = left + (right - left) / 2

    if mid * mid == num
      return true
    elsif mid * mid > num
      right = mid
    else
      left = mid
    end
  end

  return false
end

puts is_perfect_square(16)
puts is_perfect_square(14)
puts is_perfect_square(9)
