def find_the_difference(s, t)
  s = s.split('').map(&:ord)
  t = t.split('').map(&:ord)
  result = 0

  s.concat(t).each do |num|
    result ^= num
  end

  result.chr
end

s = 'abcd'
t = 'dabec'

find_the_difference(s, t)
