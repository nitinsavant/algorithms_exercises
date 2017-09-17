# Mental Model:
# - This is looking for a specific path that has the minimum sum from start to finsh.
# - Starting from the end, breaking it into subproblems, the min_sum from above it and the min_sum from the left of it. We can take the minimum of those minimums and add the value at the current square.
# - The base case is simple because if your grid is just 1 square, you're already at the finish, and the sum is just the value of that square.
# - We also have to think of boundary conditions. Since a path shouldn't be able to come from off the grid, we can return infinity to guarantee that it won't be the minimum when compared with another value.

## RECURSIVE
def min_path_sum(grid)
  rows = grid.size
  cols = grid[0].size
  min_path_helper(grid, rows - 1, cols - 1)
end

def min_path_helper(grid, m, n, memo = {})
  return grid[m][n] if m == 0 && n == 0
  return Float::INFINITY if m < 0 || n < 0

  return memo[[m, n]] if memo[[m, n]]

  memo[[m, n]] = grid[m][n] + [min_path_helper(grid, m-1, n, memo), min_path_helper(grid, m, n-1, memo)].min
end

p min_path_sum([[0]])

## ITERATIVE
def min_path_sum(grid)
  rows = grid.size
  cols = grid[0].size
  dp = []
  rows.times { dp << [] }

  (0...cols).each do |n|
    (0...rows).each do |m|
      if m == 0 && n == 0
        dp[0][0] = grid[0][0]
      elsif m == 0
        dp[m][n] = grid[m][n] + dp[m][n-1]
      elsif n == 0
        dp[m][n] = grid[m][n] + dp[m - 1][n]
      else
        dp[m][n] = grid[m][n] + [dp[m - 1][n], dp[m][n - 1]].min
      end
    end
  end

  dp[rows - 1][cols - 1]
end


min_path_sum([[1,3,1],[1,5,1],[4,2,1]])
