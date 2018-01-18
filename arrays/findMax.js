function findMax(nums) {
  if (nums.length <= 1) { return nums[0] };

  // break array into halves
  let left = nums.slice(0, nums.length/2);
  let right = nums.slice(nums.length/2);

  // recurse into each half until you hit base case
  let leftMax = findMax(left);
  let rightMax = findMax(right);

  // gets here only after base case is hit and function actually returns value
  if (leftMax > rightMax) {
    return leftMax;
  } else {
    return rightMax;
  }
}

const nums = [20, 3, 2, -1];

console.log(findMax(nums));
