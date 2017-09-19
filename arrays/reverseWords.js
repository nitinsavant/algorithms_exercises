// Given an input string, reverse the string word by word.
//
// For example,
// Given s = "the sky is blue",
// return "blue is sky the".

var reverseWords = function(str) {
  result = [];

  words = str.split(' ');

  for (var i = words.length - 1; i >= 0; i--) {
    if (words[i] != '' ) {
      result.push(words[i]);
    }
  }

  return result.join(' ');
};

console.log(reverseWords('the sky is blue'));
