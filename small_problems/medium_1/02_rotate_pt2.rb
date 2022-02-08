# Write a method that can rotate the last n digits of a number. For example:

# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
# You may assume that n is always a positive integer.

# Input: 2 arg both integers; 
# - digits, # of rightmost digits to rotate
# Output: an integer
# - the result of rotating the # of rightmost digits in original given number
# Notes / Questions
# n will always be positive

# DS: array
# ALGO
# Create a method that takes 1 arguments; digits, ro_num
# SEPARATE number by ro_num given
# - convert given digits to a string, then an array
# - slice of ro_num, passing it to the helper method '#rotate_array'
# JOIN #rotate_array return to digits that remained unrotated

def rotate_array(array)
  array_dup = array.clone
  array_dup << array_dup.shift
end

def rotate_rightmost_digits(digits, ro_num)
  arr_digits = digits.to_s.chars
  rotating_num = arr_digits.slice!(-(ro_num)..-1)
  (arr_digits + rotate_array(rotating_num)).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917