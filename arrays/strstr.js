var strStr = function(haystack, needle) {
  if (needle === "") { return 0; };
  let match;

  for (let i = 0; i < haystack.length; i++) {
    if (haystack[i] === needle[0]) {

      match = "";
      for (let j = i; j < i + needle.length; j++) {
        match += haystack[j];
      }

      if (match === needle) {
        return i;
      }
    }
  }
  return -1;
}

console.log(strStr("hello", "ll"));
console.log(strStr("helglo", "ll"));
