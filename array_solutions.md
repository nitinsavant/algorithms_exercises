Reverse String
--------------

Write a function that takes a string as input and returns the string reversed.

Mental Model:
- To reverse a string, we have to visit every character.
- With a two-pointer solution, we can start one pointer at the left of the array and another pointer at the right.
- We swap the values at the pointers and move the pointers towards the middle.
- Once the pointers pass each other or meet at the same index, we must stop.

```ruby
def reverse_string(s)
  return s if s.length <= 1

  left = 0
  right = s.length - 1

  while left < right
      s[left], s[right] = s[right], s[left]
      left += 1
      right -= 1
  end
  s
end
```

Complexity:
- Time: O(N) because you have to visit every character of the string (except the middle char if it exists).
- Space: O(1) because Ruby strings are mutable and the swaps can be done in-place.

Valid Palindrome
----------------

Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Mental Model:
- To determine if a string is a palindrome, you have to visit every character.
- Using a two-pointer solution, we can start one at the left and one at the right.
- As we traverse towards the middle of the array, we compare characters.
- As long as the characters are equal, we keep traversing. If any of the characters aren't equal, we know it's not a palindrome.
- If the pointers meet or pass each other, there's nothing left to compare. It's a palindrome.

Special Cases:
- If it's one or zero characters, it's a palindrome.
- We must only visit alphanumeric characters.
- We have to ignore case when comparing.

```ruby
def is_palindrome(s)
  return true if s.length <= 1

  s = s.downcase.gsub(/[^A-Za-z0-9]/, '')

  left = 0
  right = s.length - 1

  while left < right
    if s[left] != s[right]
      return false
    end
    left += 1
    right -= 1
  end

  true
end
```

Complexity:
- Time: O(N) because you have to visit every character of the string. We do this multiple times with downcase, substitution, and then two-pointer comparisons. But 3N --> N --> O(N).
- Space: O(1) because Ruby strings are mutable and the downcase and substitution operations can be done in-place. If using a language with immutable strings, it'd be O(N).

Two Sum
-------

Given an array of integers, return indices of the two numbers such that they add up to a specific target. You may assume that each input would have exactly one solution, and you may not use the same element twice.

Mental Model:
- The brute force solution is to use two pointers to compare every pair of elements in the array for an O(N^2) solution.
- Since we're looking for two elements that sum to a target number, we can use information from one element to specifically target its match. We can store this information in a Hash.
- As we traverse the array, we can store difference between the value and its target in a hash.
- Then as we traverse the array, we check to see if the current value matches a difference we've already stored in a hash. If it does, then we know that there was a match earlier in the array.
- To hold on to that previous element, we can store its index in the hash as well.

Special Cases:
- We can assume that every array has one solution, so we'll always hit the early return.
- The array must have more than 1 element so no special case return is needed.

```ruby
def two_sum(nums, target)
  diff = {}

  nums.each_with_index do |num, idx|
    if diff[num]
      return [diff[num], idx]
    else
      diff[target - num] = idx
    end
  end
end
```

Complexity
- Time: O(N) because you may have to traverse the entire array to find the one solution.
- Space: O(N) because you might have to add almost every element to the hash.

Two Sum II
-----------

Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number. The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based. You may assume that each input would have exactly one solution and you may not use the same element twice.

Mental Model:
- With the array being sorted, the smallest values are on the left, and the largest values are on the right. Using two pointers, we can place a pointer at each end.
- We can sum up the values at the end and only move one of the pointers depending on if we over or undershot the target.

Special Cases:
- We need to index the results starting from 1, not 0.
- We can assume there's just one solution and we can't use the same element twice.
- Duplicate elements will just get evaluated again. Shouldn't be a problem.

```ruby
def two_sum(numbers, target)
  left = 0
  right = numbers.size - 1

  while left < right
    sum = numbers[left] + numbers[right]
    if sum > target
      right -= 1
    elsif sum < target
      left += 1
    else
      break
    end
  end
  [left + 1, right + 1]
end
```

Complexity:
- Time: O(N) because we need to visit each element of the array.
- Space: O(1) because we aren't using any additional data structures, just a couple indices and a sum. They don't scale with the input size.

Remove Duplicates from Sorted Array
------------------------------------

Given a sorted array, remove the duplicates in place such that each element appears only once, and return the new length. Do not allocate extra space for another array, you must do this in place with constant memory.

Given input array nums = [1,1,2], your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.

Mental Model:
- Since its sorted, the duplicates will always be next to each other.
- By using read/write pointers, we can update the array as it's traversed.
- We want to compare elements at two pointers, read and write.
- If elements are equal, we no longer want the value at the read pointer and can increment the read pointer.
- If the elements aren't equal, we want to keep the value at the read pointer and write it at the next available slot.

Special Cases:
- We only need to return the length of the array.
- When the replacements end, the read pointer will be at the end of the original array, and the write pointer will be at the point where the array should now end. We could traverse from the write to the read and remove the element values but the problem says we just need to return the length of the new array. Therefore we can return the value of the write pointer + 1 (to make it a length since it's an index value).
- We can start the write pointer at 0 because the 1st element will never be a duplicate.
- If the array is empty, we just need to return 0.

```ruby
def remove_duplicates(nums)  
  return 0 if nums.length == 0

  write = 0
  read = 1

  while read < nums.length
    if nums[read] == nums[write]
      read += 1
    else
      write += 1
      nums[write] = nums[read]
      read += 1
    end
  end

  write + 1
end
```

Complexity:
- Time: O(N) because we're only traversing the array once.
- Space: O(1) because we're doing it in-place and not creating a new array.

Alternative Solution:
- If space isn't a concern, we could traverse the array and place every element in a Hash Set. As we traverse the array, if we the current element is already in the Set, then we skip it. If it's not in there, we add it to our result array and to our hash. Or at the end, we can just map our hash to an array since it won't have duplicates.

Remove Element
---------------

Given an array and a value, remove all instances of that value in-place and return the new length. Do not allocate extra space for another array, you must do this in place with constant memory. The order of elements can be changed. It doesn't matter what you leave beyond the new length.

Mental Model:
- Must be in-place so separate hash or array can't be used.
- When needing to traverse an array and mutate it in place, we probably need at least a couple pointers, one to read and one to write.
- As one pointer reads each element in the array and compares it to the target value, we only write the value in the array if it doesn't equal the target.

Special Cases:
- If the array is empty, we can return 0. Any other lengths need to be checked.
- We only need to return the length of the array and we don't care what resides in the array past that length.
- The write pointer will end up at the point where it plans to write the next value. So we need to return the length of the array one before then. That would be write - 1, but to get the length using the last index, you add 1 again, so we just return write.

```ruby
def remove_element(nums, val)
  return 0 if nums.length == 0
  write = 0
  read = 0

  while read < nums.length
    if nums[read] == val
      read += 1
    else
      nums[write] = nums[read]
      write += 1
      read += 1
    end
  end
  write
end
```

Complexity:
- Time: O(N) because we only traverse the array once.
- Space: O(1) because we do the replacements in place without an extra data structure.

Three Sum
---------
