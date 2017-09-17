// Implement Merge Sort

var mergeHalves = function(arr1, arr2) {
  var merged = [];
  var idx1 = 0;
  var idx2 = 0;

  while (idx1 < arr1.length && idx2 < arr2.length) {
    if (arr1[idx1] < arr2[idx2]) {
      merged.push(arr1[idx1]);
      idx1++;
    } else {
      merged.push(arr2[idx2]);
      idx2++;
    }
  }

  return merged.concat(arr1.slice(idx1)).concat(arr2.slice(idx2));
};

var mergeSort = function(arr) {
  if (arr.length < 2) {
    return arr;
  }

  var mid = Math.floor(arr.length / 2);

  var leftArray = mergeSort(arr.slice(0, mid));
  var rightArray = mergeSort(arr.slice(mid));

  return mergeHalves(leftArray, rightArray);
};

console.log(mergeHalves([9], [4]));
console.log(mergeSort([2])); // [2]
console.log(mergeSort([9, 4, 2, 10])); // [2, 4, 9, 10]
console.log(mergeSort([9, 4, 2, 10, 5, 7, 3, 4]));
