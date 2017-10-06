def is_palindrome(s)
    return true if s.length <= 1

    s = s.downcase.gsub(/[^A-Za-z0-9]/, '')

    left = 0
    right = s.length - 1

    while left < right
        if s[left] != s[right]
            return false
        end
        left += 1
        right -= 1
    end

    true
end

is_palindrome('ab')
