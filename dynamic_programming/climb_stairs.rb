# Mental Model:
# - The problem asks for the number of distinct ways to get from point A to point B, which lends to a dynamic programming approach.
# - Here, we can start at the end, at the top of the stairs. To get to the top of the stairs, we can only come from 1 or 2 steps below the top. That allows us to break it into 2 subproblems (1 below, 2 below).
# - Since it asks us for number of ways, and there is one way to get from each of those subproblems to the top, we can combine our subproblems by just adding them together.
# - The last step is to memoize.


## Recursive Approach
def climb_stairs(n, memo = {})
  return 1 if n == 1
  return 2 if n == 2

  memo[n - 1] = climb_stairs(n - 1, memo) unless memo[n - 1]
  memo[n - 2] = climb_stairs(n - 2, memo) unless memo[n - 2]

  memo[n - 1] + memo[n - 2]
end                          # => :climb_stairs

## Iterative Approach
def climb_stairs(n)
  dp = [1, 1]        # => [1, 1]

  (2..n).each do |idx|                  # => 2..4
    dp[idx] = dp[idx - 1] + dp[idx -2]  # => 2, 3, 5
  end                                   # => 2..4

  dp[n]  # => 5
end      # => :climb_stairs

p climb_stairs(4)  # => 5

# >> 5
