# Implement the following operations of a stack using queues.
#
# push(x) -- Push element x onto stack.
# pop() -- Removes the element on top of the stack.
# top() -- Get the top element.
# empty() -- Return whether the stack is empty.
# Notes:
# You must use only standard operations of a queue -- which means only push to back, peek/pop from front, size, and is empty operations are valid.
# Depending on your language, queue may not be supported natively. You may simulate a queue by using a list or deque (double-ended queue), as long as you use only standard operations of a queue.
# You may assume that all operations are valid (for example, no pop or top operations will be called on an empty stack).

class MyStack
    def initialize()
      @stack = []
      @last_added = nil
    end

    def push(x)
      @stack.push(x)
      @last_added = x
    end

    def pop()
      temp_queue = []

      while @stack.length > 1
        x = @stack.shift()
        temp_queue.push(x)
        @last_added = x
      end

      result = @stack[0]

      @stack = temp_queue

      result
    end

    def top()
      @last_added
    end

    def empty()
      @stack.empty?
    end
end
