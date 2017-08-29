// Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
//
// The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
//
// You may assume that each input would have exactly one solution and you may not use the same element twice.
//
// Input: numbers={2, 7, 11, 15}, target=9
// Output: index1=1, index2=2

// var twoSum = function(numbers, target) {
//   if (numbers.length < 2) {
//     return undefined;
//   }
//
//   var diff = {};
//
//   for (var i = 0; i < numbers.length; i++) {
//     if (diff[numbers[i]] !== undefined) {
//       return [diff[numbers[i]] + 1, i + 1];
//     } else {
//       diff[target - numbers[i]] = i;
//     }
//   }
// };

// Space: O(n)
// Time: O(n) --> traverse array, lookup/compare n hash values, insert n hash values

var twoSum = function(numbers, target) {
  var left = 0;
  var right = numbers.length - 1;

  while (left < right) {
    var sum = numbers[left] + numbers[right];
    if (sum === target) {
      return [left + 1, right + 1];
    } else if (sum < target) {
      left++;
    } else {
      right--;
    }
  }
};

// Space: no data structures created --> O(1)
// Time: n/2 comparisons, n/2 comparisons, n assignments --> O(n)

console.log(twoSum([2, 7, 11, 15], 9));

console.log(twoSum([0, 0, 2, 7, 11, 15], 9));

console.log(twoSum([0, 1, 2, 7, 11, 15], 15));
