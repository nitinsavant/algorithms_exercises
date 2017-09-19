# Mental Model (Kadanes Algorithm):
# - 1st insight -- If you can find the max sum that ends at each index in the array, you can take the max of those results to find the overall max sum.
# - 2nd insight -- Starting from the beginning of the array, the next max sum at a particular index is either the current value OR the current value combined with the max sum from the previous index. It's the greater of those two values
#
# f(n) = [f(n - 1) + arr[n], arr[n]].max
# - This solution has a recursive subproblem built into it but it can be implemented using either iteration (bottom-up) or recursion (top-down).
# - Traversing the array using this formula will result in an array of max values. One further optimization is to just carry the current maximum value as you traverse the array because that's all you need once you traverse through the entire array.
#

## RECURSIVE SOLUTION
def max_sub_array(nums, n = (nums.size - 1))
  return nums[0] if n == 0

  [max_sub_array(nums, n - 1) + nums[n], nums[n]].max
end

max_sub_array([-2,1,-3,4,-1,2,1,-5,4])

## ITERATIVE SOLUTION
def max_sub_array(nums)
  dp = [nums[0]]

  (1...nums.size).each do |i|
    dp[i] = [dp[i - 1] + nums[i], nums[i]].max
  end
  dp.max
end

## DONT NEED ENTIRE DP ARRAY, JUST PREVIOUS MAX AND GLOBAL MAX

def max_sub_array(nums)
  max = current_max = nums[0]

  (1...nums.size).each do |i|
    current_max = [current_max + nums[i], nums[i]].max
    max = current_max > max ? current_max : max
  end
  max
end
