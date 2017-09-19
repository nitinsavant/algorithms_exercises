// Implement pow(x, n).

// myPow(2, 3) --> x * myPow(x, n - 1)
//
// base case: n = 1

var myPow = function(x, n) {
  if (n === 0 || x === 1) {
    return 1;
  }

  if (n < 0) {
    n = -n;
    x = 1/x;
  }

  return x * myPow(x, n - 1);
};

// var myPow = function(x, n, acc = 1) {
//   if (n === 0) {
//     return acc;
//   }
//
//   return myPow(x, n - 1, acc*x);
// };

console.log(myPow(4, -2)); // 0.0625
// console.log(myPow(8.88023, 3));
// console.log(myPow(0.00001, 2147483647));
console.log(myPow(4, 1)); // 4
console.log(myPow(2, 3)); // 8
console.log(myPow(-1, 9)); // -1
console.log(myPow(4, 3)); // 64
