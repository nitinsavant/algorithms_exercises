# Mental Model:














## Elises Solution
def coin_change(coins, amount)
  memo = [0]
  (1..amount).each do |total|
    min = -1
    coins.each do |coin|
      next if coin > total || memo[total-coin] == -1
      new_min = memo[total-coin] + 1
      min = min == -1 ? new_min : [new_min, min].min
    end
    memo[total] = min
  end
  memo[amount]
end

coin_change([186,419,83,408], 6249)
