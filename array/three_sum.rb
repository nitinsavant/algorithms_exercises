# Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
#
# Note: The solution set must not contain duplicate triplets.
#
# For example, given array S = [-1, 0, 1, 2, -1, -4],
#
# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]

def three_sum(nums)

end

p three_sum([-1, 0, 1, 2, -4, -4])

# Brute force would be 3 nested loops and result in O(n^3)
# Sort the array with a complexity of O(NlogN). Then we can do a binary search. That would result in O(N^2logN)
# Sort the array. O(NlogN) again. Scan through list
