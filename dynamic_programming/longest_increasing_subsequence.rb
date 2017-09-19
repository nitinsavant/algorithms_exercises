# # # Mental Model:
# - Using DP, we can fill up an array as we iterate through it. The elements of the array will be the LIS ending at that index. Therefore, when the array is filled, we need to return the max value of it.
# - To find the LIS ending at an index, we can compare the value (at that index) with every other value preceding it in the array. If the value is greater than a previous value, then we know the LIS is 1 more than the LIS at that previous value. We do this for each preceding value and take the maximum of all the previous LIS's.

def length_of_lis(nums)
  return 0 if nums.length == 0
  dp = [1] * nums.length

  (1..nums.length-1).each do |i|
    max = 1
    (0..i-1).each do |j|
      if nums[i] > nums[j]
        max = dp[j] + 1 > max ? dp[j] + 1 : max
      end
    end
    dp[i] = max
  end
  dp.max
end

nums = [1,3,6,7,9,4,10,5,6]

length_of_lis(nums)
