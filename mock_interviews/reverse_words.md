Reverse Words II
-----------------

Problem: Given an input string, reverse the string word by word.

Notes:
- Use Ruby for the solution.
- Assume the input doesn’t contain leading or trailing spaces.
- Assume the words are always separated by a single space.
- Solution should be O(N) time and O(1) space.
- Don't use `substring` method because it creates a new string in its implementation.


Mental Model:
- This can be done in 2 steps.
- First, you use left/right pointers to reverse the entire string.
- Second, you use anchor/runner pointers to find where a word starts and ends. Once you encounter a word ending (i.e. a space), you pass the entire string to a helper function to reverse the word between your two anchor/runner pointers. Then you continue reversing words through the end of the array.
- The order of the two steps doesn't matter.

Notes on El:
- Start Time: 11:48
- Got to O(N) time and O(N) space solution in a few minutes
- Thought of a stack idea to slightly reduce time but still O(N)
- Had a solution that would work but she didn't think mental model was good enough.
- I had trouble giving hints without giving too much away.
- She came up with the idea to use a helper method on her own.
- Good job of talking out loud, there was jus tone place when she was trying to figure out a better complexity solution
- Talk more confidently when coding. Say obvious things too. and why you made certain decisions
- Walk through some examples
- Worried about off-by-one with your reverse

Positives: Extremely strong coding fluency, had a great idea to use a helper method to effectively break the problem into 2 manageable parts. Room for improvement: Should come up with examples and test cases, could talk more while coding just to keep the interviewer engaged, once done coding should walk through the code with her test cases
