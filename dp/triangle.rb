# Mental Model
# - Start from the top because there is only one path from there.
# - The solution at the top can be broken into the subproblems of the adjacent values on the next row. The solution is the minimum of those two subproblem solutions + the value at the top (or current node) as you traverse down.
# - Base case: If you reach the bottom of triangle, just return the current value
# - Boundary conditions: If the col goes < 0 or greater than row + 1, return Infinity because you dont ever want to choose that as the minimum

def minimum_total(triangle, m = 0, n = 0, memo = {})
  return triangle[m][n] if m == triangle.size - 1

  memo[[m+1, n]] ||= minimum_total(triangle, m + 1, n)
  memo[[m+1, n+1]] ||= minimum_total(triangle, m + 1, n + 1)

  triangle[m][n] + [memo[[m+1, n]], memo[[m+1, n+1]]].min
end

minimum_total([[2],[3,4],[6,5,7],[4,1,8,3]])
