# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# a => 4
# b => [1, 8]
# arr => [4, [1, 8]]
# WRONG!!!

# a => 2
# BECAUSE line 7, pointed the arr[0] at a different object NOT our variable 'a' which still pointed at 2
# b => [3, 8]
# arr => [4, [3, 8]]