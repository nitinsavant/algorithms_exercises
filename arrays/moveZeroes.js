var moveZeroes = function(nums) {
  let write = -1;
  let read = 0;

  while (read < nums.length) {
    if (nums[read] !== 0) {
      write++;
      nums[write] = nums[read];
    }
    read++;
  }

  write++;

  while (write < nums.length) {
    nums[write] = 0;
    write++;
  }
};
