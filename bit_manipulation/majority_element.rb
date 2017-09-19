def majority_element(nums)
  mask = 1
  result = 0
  size = nums.size

  (0...3).each do |_|
    count = 0
    nums.each do |num|
      count += 1 if (mask & num) != 0
    end
      result |= mask if count > size/2
      mask <<= 1
  end
  result
end

nums = [6, 6, 6]

majority_element(nums)
