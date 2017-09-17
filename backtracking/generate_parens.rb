# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
#
# For example, given n = 3, a solution set is:
#
# [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]

def convert_to_parens(result)
  str = ''

  result.each do |nums|
    nums.each do |num|
      if num == -1
        str << ')'
      else
        str << '('
      end
    end
  end
  str
end

def generate_parenthesis(n)
  nums = []
  n.times do |n|
    nums << 1
    nums << -1
  end

  result = []
  paren_helper(nums.sort!, result)

  convert_to_parens(result)
end

def paren_helper(nums, result, solution = [], visited_indices = {}, current_sum = 0, start = 0)
  if solution.size == nums.size && current_sum == 0
    return result << solution.clone
  end

  (0...nums.length).each do |idx|
    next if nums[idx] == nums[idx - 1] && idx != start
    next if visited_indices[idx]
    next if current_sum + nums[idx] < 0

    visited_indices[idx] = 1
    current_sum += nums[idx]

    solution << nums[idx]
    paren_helper(nums, result, solution, visited_indices, current_sum, idx + 1)

    current_sum -= nums[idx]
    visited_indices.delete(idx)
    solution.pop
  end
end

p generate_parenthesis(2)

# Kevin's solution
# def generate_parenthesis(n)
#     result = []
#     generate_parenthesis_helper(n, "", 0, 0, result)
#     result
#
# end
#
# def generate_parenthesis_helper(n, solution, left, right, result)
#     return if left > n || right > n || right > left
#     if solution.size == 2*n
#         result << solution.clone
#     else
#         generate_parenthesis_helper(n, solution+"(", left+1, right, result)
#         generate_parenthesis_helper(n, solution+")", left, right+1, result)
#     end
# end
