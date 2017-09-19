// Find a number in an array and return its index. If not found, return -1

// Problem:
// - Input:
//   - array of numbers
//   - target
// - Output: index
// - Return -1 if the target isnt found in the array
//
// Algorithm:
// - findIndex([1, 2, 3]) --> findIndex([1]) || findIndex([2, 3])
// - Base case: check 1 element array


function findIndex(arr, target) {
  return findIndexHelper(arr, target, 0);
}

function findIndexHelper(arr, target, index) {
  if (index === arr.length - 1) {
    return -1;
  }

  if (arr[index] === target) {
    return index;
  } else {
    return findIndexHelper(arr, target, index + 1)
  }
}

console.log(findIndex([0, 1, 2, 3], 0)); // 0
console.log(findIndex([5, 1, -3, 3], 0)); // -1
console.log(findIndex([5, 1, -3, 3], -3)); // 2
