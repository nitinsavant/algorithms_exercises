def binary_search(array, target)
  return binary_search_recurse(array, 0, array.length - 1, target)
end

def binary_search_recurse(array, left, right, target)
  return -1 if array.length == 0

  if left + 1 >= right
    if array[left] == target
      return left
    elsif array[right] == target
      return right
    else
      return -1
    end
  end

  mid = left + (right - left) / 2

  if array[mid] == target
    return mid
  elsif array[mid] > target
    binary_search_recurse(array, left, mid, target)
  else
    binary_search_recurse(array, mid, right, target)
  end
end

p binary_search([8], 8) # 0
p binary_search([5, 6, 7, 8, 9, 10], 8) # 3
p binary_search([5, 6, 7, 8, 9, 10], 10) # 5
p binary_search([5, 6, 7, 8, 9, 10], 4) # -1
