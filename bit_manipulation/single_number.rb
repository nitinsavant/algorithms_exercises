def single_number(nums)
  result = 0

  nums.each do |num|
    result ^= num
  end
  result
end
