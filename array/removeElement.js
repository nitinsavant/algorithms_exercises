// Given an array and a value, remove all instances of that value in place and return the new length.
//
// Do not allocate extra space for another array, you must do this in place with constant memory.
//
// The order of elements can be changed. It doesn't matter what you leave beyond the new length.
//
// Example:
// Given input array nums = [3,2,2,3], val = 3
//
// Your function should return length = 2, with the first two elements of nums being 2.

// var removeElement = function(nums, val) {
//   var valIdx = nums.indexOf(val);
//
//   while (valIdx >= 0) {
//     nums.splice(valIdx, 1);
//     valIdx = nums.indexOf(val);
//   }
//
//   return nums.length;
// };

// Space: O(1)
// Time: Cheated by using `indexOf` and `splice`. I have no idea what Big O is of those built-in JS methods.


var removeElement = function(nums, val) {
  var read = 0;
  var write = 0;

  while (read < nums.length) {
    if (nums[read] !== val) {
      nums[write] = nums[read];
      write++;
    }
    read++;
  }

  return write;
};

// Space: O(1)
// Time: O(n)

// Read-write pointer pattern


console.log(removeElement([3, 2, 2, 3], 3));
