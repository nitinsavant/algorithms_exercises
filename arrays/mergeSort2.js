var mergeSort = function(arr) {
  if (arr.length <= 1) {
    return arr;
  }

  let left = mergeSort(arr.slice(0, arr.length/2));
  let right = mergeSort(arr.slice(arr.length/2));

  let leftIdx = 0;
  let rightIdx = 0;
  let result = [];

  while (leftIdx < left.length && rightIdx < right.length) {
    if (right[rightIdx] < left[leftIdx]) {
      result = result.concat(right[rightIdx]);
      rightIdx++;
    } else {
      result = result.concat(left[leftIdx]);
      leftIdx++;
    }
  }

  if (leftIdx === left.length) {
    result = result.concat(right.slice(rightIdx));
  } else if (rightIdx === right.length ) {
    result = result.concat(left.slice(leftIdx));
  }

  return result;
};


console.log(mergeSort([9, 5, 7, 1]));
console.log(mergeSort([5, 3]));
console.log(mergeSort([6, 2, 7, 1, 4]));
console.log(mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']));
console.log(mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]));
