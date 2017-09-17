# Mental Model:
# - If the coins are sorted, you can start with the back, and add values to a solution until you exceed the target, then you backtrack, and continue with the next smaller denomination. If you hit the target, then you return the number of values. If you reach the beginning of the array, you return -1.
# - Sort the coins so you can start from largest denomination.
# - Starting from the largest coin, skip it if it's greater than current target amount. Otherwise, subtract the coin value from the amount, and repeat. Keep track of the num_coins youre adding. 


def coin_change(coins, amount)

end

coin_change([186,419,83,408], 6249)
