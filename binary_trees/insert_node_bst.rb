def insert_node(root, node)
  root = node if root.nil?

  if node.val < root.val
    if root.left.nil?
      root.left = node
    else
      insert_node(root.left)
    end
  else
    if root.right.nil?
      root.right = node
    else
      insert_node(root.right)
    end
  end

  root
end
