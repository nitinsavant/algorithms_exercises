class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def preorder_traversal(root)
  preorder_helper(root, [])
end

def preorder_helper(root, result)
  return result if root.nil?

  result.push(root.val)
  preorder_helper(root.left, result)
  preorder_helper(root.right, result)

  result
end
