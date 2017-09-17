# Implement the following operations of a queue using stacks.
#
# push(x) -- Push element x to the back of queue.
# pop() -- Removes the element from in front of queue.
# peek() -- Get the front element.
# empty() -- Return whether the queue is empty.
# Notes:
# You must use only standard operations of a stack -- which means only push to top, peek/pop from top, size, and is empty operations are valid.
# Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or deque (double-ended queue), as long as you use only standard operations of a stack.
# You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).

class MyQueue
    def initialize()
      @stack = []
    end

    def push(x)
      @stack.push(x)
    end

    def pop()
      temp_stack = []

      while @stack.length > 0
        temp_stack.push(@stack.pop())
      end

      result = temp_stack.pop()

      while temp_stack.length > 0
        @stack.push(temp_stack.pop())
      end

      result
    end

    def peek()
      temp_stack = []

      while @stack.length > 0
        temp_stack.push(@stack.pop())
      end

      result = temp_stack[-1]

      while temp_stack.length > 0
        @stack.push(temp_stack.pop())
      end

      result
    end

    def empty()
      @stack.empty?
    end
end
