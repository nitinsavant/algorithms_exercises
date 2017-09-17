# Mental Model:
# - The problem asks for "unique paths" which like "distinct ways" lends itself to DP.
# - Here, we can again start at the end and break it into subproblems. To get to the end, there are 2 possible paths, from above it, and to the left of it. Therefore, the num_paths from the end can be broken into the sum of those two subproblems.
# - The base case is simple because if your grid is just 1 square, you're already at the finish, and that's one way.
# - We also have to think of boundary conditions. If a subproblem comes from off the grid, there will be no distcint paths there.

## RECURSIVE
def unique_paths(m, n, memo = {})
  return 0 if m < 0 || n < 0
  return 1 if m == 1 && n == 1

  memo[[m-1, n]] = unique_paths(m-1, n, memo) unless memo[[m-1, n]]
  memo[[m, n-1]] = unique_paths(m, n-1, memo) unless memo[[m, n-1]]

  memo[[m-1, n]] + memo[[m, n-1]]
end

## ITERATIVE
def unique_paths(m, n)
  dp = [[]] * m

  (0...m).each do |row|
    (0...n).each do |col|
      if row == 0 || col == 0
        dp[row][col] = 1
        next
      end

      dp[row][col] = dp[row][col - 1] + dp[row - 1][col]
    end
  end

  dp[m - 1][n - 1]
end

p unique_paths(3, 3)
