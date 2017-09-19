# Mental Model:
# - Use backtracking to build a recursive function that returns all the different substring partitions of the input string.
# - To build the substring sets, you can iterate on different lengths for the first substring in each set. This can be done by building the first substring using a different ending index each time, going from 0 to the last index of the string. 
# - And then just check if each substring is a palindrome. If not, then you skip that substring.

def partition(s, result = [], solution = [])
  return result << solution.clone if s.length == 0

    (0...s.length).each do |idx|
      head = s[0..idx]
      tail = s[(idx + 1)...s.length]

      next unless is_palindrome(head)
      solution << head

      partition(tail, result, solution)
      solution.pop
    end
    result
end

def is_palindrome(s)
  left = 0
  right = s.length - 1

  while left < right
    return false unless s[left] == s[right]
    left += 1
    right -= 1
  end
  true
end

partition('efe')
