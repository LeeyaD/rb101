# Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

# INPUT: an 'array'
# ? how to handle bad input?
# OUTPUT: an integer
# - value that appears exactly twice
# RULES
# - implicit
#   - 
# - explicit
#  - given 'array' is unordered
#  - only 1 value occurs exactly twice
#  - all other values occur once

# DS: Array
# ALGO:
# 1. Create a method that takes 1 arg, 'array'
# 2. ITERATE thru Array, for current value
# ITERATE w/ #each
#  2a. DETERMINE how many times it occurs in the array
#  - DETERMINE - #count
#  - 
#  2b. IF it appears twice, save & return in a variable

def find_dup(array)
  array.select { |n| array.count(n) == 2 }.first
end

puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
