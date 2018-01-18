function binarySearch(arr, target) {
  let left = 0;
  let right = arr.length - 1;
  let mid;

  while (left <= right) {
    mid = Math.floor(left + (right - left) / 2);

    if (arr[mid] === target) {
      return mid;
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return 'Not found';
}

const arr = [1, 3, 4, 5, 5, 7, 8, 10];
const target = 3;

console.log(binarySearch(arr, target));
