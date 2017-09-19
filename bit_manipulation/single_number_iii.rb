def single_number(nums)
  n = 0
  result = []

  nums.each do |num|
    n = n ^ num
  end

  flag = n & ~(n-1)
  a = 0
  b = 0

  nums.each do |num|
    if (flag & num == 0)
      a ^= num
    else
      b ^= num
    end
  end
  result << a
  result << b
  result
end
