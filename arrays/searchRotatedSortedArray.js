// Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
// (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
//
// You are given a target value to search. If found in the array return its index, otherwise return -1.
//
// You may assume no duplicate exists in the array.

var search = function(nums, target) {
  var left = 0;
  var right = nums.length - 1;

  while (left + 1 < right) {
    var mid = Math.floor(left + (right - left) / 2);

    // found target
    if (nums[mid] === target) {
      return mid;
    }

    // slope increasing from left to mid (if it exists, pivot is after mid)
    if (nums[left] <= nums[mid]) {
      // if target between left and mid, throw out right half
      if (target >= nums[left] && target < nums[mid]) {
        right = mid;
      } else {
        left = mid;
      }
    // slope increasing from mid to right (if it exists, pivot is before mid)
    } else {
      // if target between mid and right, throw out left half
      if (target > nums[mid] && target <= nums[right]) {
        left = mid;
      } else {
        right = mid;
      }
    }
  }

  if (nums[left] === target) {
    return left;
  } else if (nums[right] === target) {
    return right;
  } else {
    return -1;
  }
};

console.log(search([3, 5, 7], 3)); // 0
console.log(search([3, 5, 1], 3)); // 0
console.log(search([3, 1, 2], 3)); // 0

console.log(search([4, 5, 6, 7, 0, 1, 2], 6)); // 2

console.log(search([4, 5, 6, 7, 0, 1, 2], 0)); // 4
console.log(search([4, 5, 6, 7, 0, 1, 2], 3)); // -1

console.log(search([4, 5, 6, 7, 0, 1, 2, 3], 2)); // 6
console.log(search([2, 3, 4, 5, 6, 7, 0, 1], 2)); // 0
