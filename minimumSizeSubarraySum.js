// Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
//
// For example, given the array [2,3,1,2,4,3] and s = 7,
// the subarray [4,3] has the minimal length under the problem constraint.
//
// click to show more practice.
//
// More practice:
// If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).

/**
 * @param {number} s
 * @param {number[]} nums
 * @return {number}
 */
var minSubArrayLen = function(s, nums) {

};

Requirements:
- Input:
  - array of numbers (all positive)
  - sum (positive integer)
- Output: subarray
- find a subarray for which sum of elements equals input sum
- if you cant find, find close

console.log(minSubArrayLen([2, 3, 1, 2, 4, 3], 7));
