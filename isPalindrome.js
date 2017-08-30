// Write a program to tell if a word is a palindrome with recursion

// function isPalindrome(word) {
//   var left = 0;
//   var right = word.length - 1;
//
//   while (left < right) {
//     if (word[left] !== word[right]) {
//       return false;
//     }
//     left++;
//     right--;
//   }
//
//   return true;
// }

// Iterative method
// Space: O(1)
// Time: O(N)

function isPalindrome(word) {
  if (word.length <= 1) {
    return true;
  } else if (word.length === 2) {
    return word[0] === word[1];
  } else {
    return isPalindrome(word[0] + word[word.length - 1]) && isPalindrome(word.slice(1, -1));
  }
}


function isPalindrome(word) {
  if (word.length === 0) {
    return true;
  } else if (word[0] !== word[word.length - 1]) {
    return false;
  }

  return isPalindrome(word.slice(1, word.length - 1));
}

// Recursive method
// Space:
// Time:

console.log(isPalindrome(''));
console.log(isPalindrome('N'));
console.log(isPalindrome('nittin'));
console.log(isPalindrome('nitin'));
console.log(isPalindrome('Nittin'));
