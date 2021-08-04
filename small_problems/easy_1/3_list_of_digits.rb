# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# Input: a positive integer
# Output: an array of digits that make up the input
# Approach:
# 1. SEPARATE int arg into an array of individual digits
# *SEPARATE
# - turn int arg into a string
# - separate string into an array
# - transform each string element in array into an integer
# - returned the transformed array
def digit_list(number)
  number_str = number.to_s
  arr = number_str.chars
  arr.map(&:to_i)
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true