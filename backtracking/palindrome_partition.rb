def partition(s, result = [], solution = [], pointer = 1)
  return result << solution.clone unless s

  (pointer..s.length).each_with_index do |char, idx|
    if is_palindrome(s[idx..pointer])
      partition(s[pointer..-1], result, solution, pointer + 1)
    end

  end

end

def is_palindrome(str)
  str == str.reverse
end

p partition('aab')
