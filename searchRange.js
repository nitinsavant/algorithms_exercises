// Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.
//
// Your algorithm's runtime complexity must be in the order of O(log n).
//
// If the target is not found in the array, return [-1, -1].
//
// For example,
// Given [5, 7, 7, 8, 8, 10] and target value 8,
// return [3, 4].

var searchRange = function(nums, target) {
  var leftmost = -1;
  var rightmost = -1;

  // Find the first (left-most) instance of target
  var left = 0;
  var right = nums.length - 1;

  while (left + 1 < right) {
    mid = Math.floor(left + (right - left) / 2);

    if (nums[mid] >= target) {
      right = mid;
    } else {
      left = mid;
    }
  }

  if (nums[left] == target) {
    leftmost = left;
  } else if (nums[right] === target) {
    leftmost = right;
  }

  // Find the last (right-most) instance of target
  right = nums.length - 1;

  while (left + 1 < right) {
    mid = Math.floor(left + (right - left) / 2);

    if (nums[mid] <= target) {
      left = mid;
    } else {
      right = mid;
    }
  }

  if (nums[right] === target) {
    rightmost = right;
  } else if (nums[left] === target) {
    rightmost = left;
  }

  return [leftmost, rightmost]
};

// Binary Search: 60%
// Time: O(logN)
// Space: O(1)


console.log(searchRange([2, 2], 2)); // [0, 1]
console.log(searchRange([5, 7, 7, 8, 8, 10], 8)); // [3, 4]
console.log(searchRange([5, 7, 8, 8, 8, 10], 8)); // [2, 4]
