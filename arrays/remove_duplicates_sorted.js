// - Set write pointer to 0, read pointer to 1
// - Loop through array while read pointer is less than length
//   - If value at write pointer !== value at read pointer
//     - increment write pointer
//     - Assign write pointer value to equal read pointer value
//   - Increment read pointer
// - Return write pointer + 1


var removeDuplicates = function(nums) {
  if (nums.length <= 1) { return nums; }

  let write = 0;
  let read = 1;

  while (read < nums.length) {
    if (nums[write] !== nums[read]) {
      write = write + 1;
      nums[write] = nums[read];
    }
    read = read + 1;
  }
  return write + 1;
}
