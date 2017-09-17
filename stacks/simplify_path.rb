# Given an absolute path for a file (Unix-style), simplify it.
#
# For example,
# path = "/home/", => "/home"
# path = "/a/./b/../../c/", => "/c"
#
# Corner Cases:
# Did you consider the case where path = "/../"?
# In this case, you should return "/".
# Another corner case is the path might contain multiple slashes '/' together, such as "/home//foo/".
# In this case, you should ignore redundant slashes and return "/home/foo".

def simplify_path(path)
  stack = []
  result = ''

  path.split('/').each do |dir|
    if dir == '' || dir == '.'
      next
    elsif dir == '..'
      stack.pop()
    else
      stack.push(dir)
    end
  end

  while stack.length > 0
    result = '/' + stack.pop() + result
  end

  return '/' if result == ''

  result
end

p simplify_path("/home/")           # "/home"
p simplify_path("/home//foo/")      # "/home/foo"
p simplify_path("/a/./b/../../c/")  # "/c"
p simplify_path("/../")             # "/"
