// - Loop through array from index 0 to end
//   - Set target = current value
//   - Loop through array
//     - If indices arent equal, add to hash with key being target - element, and value being index of 2nd loop
//   - Loop through array
//     - If 1st and 3rd loop indices arent equal and current value is in hash, add subarray to solution set with values from all 3 indices


- Sort the array
- Loop through array; for each element
  - Set target equal to negative of current value
  - Set left pointer to next element in array
  - Set right pointer to last element
  - Loop through remaining array
    -


var threeSum = function(nums) {
  if (nums.length < 3) { return []; }

  nums.sort();
  let solution = [];

  for (let idx1 = 0; idx1 < nums.length; idx1++) {
    let target = nums[idx1];
    let diffs = {};

    for (let idx2 = 0; idx2 < nums.length; idx2++) {
      if (idx1 !== idx2) {
        diffs[-(target + nums[idx2])] = idx2;
      }
    }

    for (let idx3 = 0; idx3 < nums.length; idx3++) {
      idx2 = diffs[nums[idx3]];

      if (idx1 !== idx3 && idx2 && idx2 !== idx3) {
        solution.push([nums[idx1], nums[idx2], nums[idx3]]);
      }
    }
  }

  return solution;
}
