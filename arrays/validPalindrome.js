// Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
//
// For example,
// "A man, a plan, a canal: Panama" is a palindrome.
// "race a car" is not a palindrome.
//
// Note:
// Have you consider that the string might be empty? This is a good question to ask during an interview.
//
// For the purpose of this problem, we define empty string as valid palindrome.

var isPalindrome = function(s) {
  if (s.length <= 1) {
    return true;
  }

  var cleaned = s.replace(/[^A-Z0-9]/ig, '').toLowerCase();
  var lPointer = 0;
  var rPointer = cleaned.length - 1;

  while (lPointer < rPointer) {
    if (cleaned[lPointer] !== cleaned[rPointer]) {
      return false;
    }
    lPointer++;
    rPointer--;
  }

  return true;
}

console.log(isPalindrome("A man, a plan, a canal: Panama")); // true

console.log(isPalindrome("race a car")); // false

// Space: O(n) --> created new string of n chars
// Time: O(n) --> n/2 evaluations + n evaluations = 1.5n = O(n)

// Is the space complexity actually O(n) since JS strings aren't mutable and the size of the cleaned string increases as the input size increases?

// Kevin recommended not preprocessing using regex and lowercase. If you're focusing on algorithmic performance, work on a lower level solution and don't rely on those things.
// Preprocessing is not that big of a deal when the time complexity is already O(n). But if it's better than that, then you're killing your performance by going up to O(n) with preprocessing.
// It's most important that you know how to solve the problem without preprocessing.
