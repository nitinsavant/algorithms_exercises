# Problem: Given 2 arrays, write a function to compute their intersection.
#
# Questions:
# - arrays can be different sizes
# - stick with integers
# - what about order?
# - order of result doesnt matter
#
# Edge case:
# - If either is empty, result is empty.
#
# De-duplicate the results array using a 2-pointer.
# - read/write pointers
#
# Algorithm:
# - Iterate through first array and store every value in a Hash.
# - Iterate through 2nd array, look up value in hash.
#   - If found, add to result array AND update hash to false.
#   - Else, nothing
#
# {1: true, 2: true, 3: true, 4, 5}
#


def intersection(arr1, arr2)
  return [] if arr1.empty? || arr2.empty?

  result = []
  found = {}

  arr1.each do |ele|
    found[ele] = true
  end

  arr2.each do |ele|
    if found[ele]
      result << ele
      found[ele] = false
    end
  end

  result
end

array_1 = [1, 2, 3, 1]
array_2 = [2, 3, 1, 2]

result = [2, 3, 1]
