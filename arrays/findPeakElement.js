// A peak element is an element that is greater than its neighbors.
//
// Given an input array where num[i] ≠ num[i+1], find a peak element and return its index.
//
// The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
//
// You may imagine that num[-1] = num[n] = -∞.
//
// For example, in array [1, 2, 3, 1], 3 is a peak element and your function should return the index number 2.

var findPeakElement = function(nums) {
  var left = 0;
  var right = nums.length - 1;
  var mid;

  while (left + 1 < right) {
    mid = Math.floor(left + (right - left) / 2);

    if ((nums[mid] > nums[mid - 1]) && (nums[mid] > nums[mid + 1])) {
      return mid;
    } else if (nums[mid] > nums[mid - 1]) {
      left = mid;
    } else {
      right = mid;
    }
  }

  if (nums[left] > nums[right]) {
    return left;
  } else {
    return right;
  }
};

console.log(findPeakElement([2, 1])); // 0

console.log(findPeakElement([1, 2, 3, 1])); // 2
