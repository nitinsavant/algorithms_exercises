# Mental Model
# - Use backtracking to build a set of subtrings. The dead-end condition is if the current substring is not in the dictionary. But it's very slow. It's O(n^2) time complexity.
# - Instead, since we don't need to save all the subtrings, we just need to return a boolean, DP is worth a shot. Need to break the problem down into subproblems.
# - The solution involves building the solution up char by char. Therefore, we iterate from 1 to 8. Each iteration adds a character to the substring and stores the result of running the function on it. We can't start at 0 because we need to initialize dp[0] to true, forcing us to shift the string by 1 index. Then for each of those strings we're building, we iterate on all the possible substrings within it and check to see if we can find a set of subtrings that are all in the dictionary. We do this by checking previous values and recursing into upcoming values. 

def word_break(s, word_dict)
  dp = [true]

  (1..s.length).each do |i|
    (0..i-1).each do |j|
      break if dp[i] = dp[j] && word_dict.include?(s[j...i])
    end
  end
  dp
  dp[s.length] == true
end

word_break('leetcode', ["leet", "code"])
