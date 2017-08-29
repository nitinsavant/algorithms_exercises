# Write a function that takes a string as input and returns the string reversed.
#
# Example:
# Given s = "hello", return "olleh".

def reverse_string(s)
  return s if s.length <= 1

  l_pointer = 0
  r_pointer = s.length - 1

  while l_pointer < r_pointer
    s[l_pointer], s[r_pointer] = s[r_pointer], s[l_pointer]
    l_pointer += 1
    r_pointer -= 1
  end

  s
end

# Space -- O(1)
# Time -- O(n) = 1 swap per element in the array
