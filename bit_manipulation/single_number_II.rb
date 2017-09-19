def single_number(nums)
  ones = 0               # => 0
  twos = 0               # => 0

  nums.each do |num|           # => [101, 100, 101, 101]
    ones = ones ^ num & ~twos  # => 101, 1,   0, 100
    twos = twos ^ num & ~ones  # => 0,   100, 1, 0
  end                          # => [101, 100, 101, 101]
  return ones                  # => 100
end                            # => :single_number

nums = [101, 100, 101, 101]  # => [101, 100, 101, 101]

single_number(nums)  # => 100
