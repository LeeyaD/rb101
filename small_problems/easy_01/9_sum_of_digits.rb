# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# Input: a positive integer
# - will always be positive
# - can contain _
# Output: sum of the digits of the integer
# APPROACH:
# 1. With positive integer arg
# 2. Separate arg into it's individual digits
# 3. Return sum of digits
# DS: array
# ALGO
# 1. Take positive int arg
# 2. SEPARATE -> convert int arg into a string, then convert to an array
# 3. ITERATE thru array, for current element transform into an integer
# 4. sum & return elements in array

def sum(number)
  number.to_s.chars.map(&:to_i).sum
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).