class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

## Recursion with helper
def inorder_traversal(node)
  result = []
  inorder_helper(node, result)
  result
end

def inorder_helper(node, result)
  if node
    inorder_helper(node.left, result)
    result.push(node.val)
    inorder_helper(node.right, result)
  end
end

## Traversal

def inorder_traversal(root)
  return [] if root.nil?
  list = []
  stack = []

  while root || stack.length > 0
    while root
      stack.push(root)
      root = root.left
    end

    root = stack.pop()
    list.push(root.val)
    root = root.right
  end
  
  list
end
