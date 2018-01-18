// function insert(nums, value, insertIdx) {
//   let i = nums.length;
//
//   while (i > insertIdx) {
//     nums[i] = nums[i-1];
//     i--;
//   }
//
//   nums[i] = value;
//
//   return nums;
// }

// function insertionSort(nums) {
//   for (let i = 1; i < nums.length; i++) {
//     let j = i - 1;
//     let active = nums[i];
//
//     while (j >= 0) {
//       if (active < nums[j]) {
//         nums[j+1] = nums[j];
//         j--;
//       } else {
//         break;
//       }
//     }
//     nums[j+1] = active;
//   }
//   return nums;
// }

function insertionSort(nums) {
  for (let i = 1; i < nums.length; i++) {
    let active = nums[i];

    let j = i - 1;

    while (j >= 0) {
      if (active < nums[j]) {
        j--;
      } else {
        j++;
        break;
      }
    }

    if (j < 0) { j++; };

    const insertIdx = j;
    let k = i;

    while (k > insertIdx) {
      nums[k] = nums[k-1];
      k--;
    }

    nums[k] = active;
  }
  return nums;
}

console.log(insertionSort([5, 1, 2, 3, 4]));
