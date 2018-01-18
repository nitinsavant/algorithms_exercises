function bubbleSort(nums) {
  let swapped = true;
  let temp;

  while (swapped) {
    swapped = false;

    for (let i = 0; i < nums.length - 1; i++) {
      if (nums[i] > nums[i + 1]) {
        swapped = true;
        temp = nums[i];
        nums[i] = nums[i + 1];
        nums[i + 1] = temp;
      }
    }
  }

  return nums;
}

console.log(bubbleSort([5, 3, 4, 1, 2]));
