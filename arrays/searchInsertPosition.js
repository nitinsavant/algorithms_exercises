function searchInsert(arr, target) {
  let left = 0;
  let right = arr.length - 1;
  let mid;

  while (left + 1 < right) {
    mid = Math.floor(left + (right - left) / 2);

    if (arr[mid] === target) {
      return mid;
    } else if (arr[mid] < target) {
      left = mid;
    } else {
      right = mid;
    }
  }

  if (target <= arr[left]) {
    return left;
  } else if (target <= arr[right]) {
    return right;
  } else if (target > arr[right]) {
    return right + 1;
  }
}

const arr = [1, 3, 5, 6];
const target = 2;

console.log(searchInsert(arr, target));
