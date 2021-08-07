# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

# Input: an array
# - array will never be empty
# - integers in array will always be positive
# - how to handle decimals, 0??
# Output: an integer
# - an avg of all integers in given array
# APPROACH
# 1. Taking array arg
# 2. Add up all integers and divide by the # of elements in the array
# 3. Output the result
# DS: Array
# ALGO - problem is too simple

def average(array)
  array.sum / array.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40