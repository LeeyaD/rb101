# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

# Input: an Integer
# ? - How to hand bad input? (i.e. non-Integer, negatives, zero)
# Output: the given Integer doubles or as-is
# - If given Integer is a 'double number' output it as-is
# - If given Integer is NOT a 'double number' output it multiplied by 2
# DOUBLE NUMBER: when the left & right sides are exactly the same
# - Ex. double #s: 44, 3333, 103103, 7676
# - Ex. non-double #s: 444, 334433, 107
# - numbers w/ an odd no of digits cannot be double numbers
# - must be exactly the same when read left to right, palindromes are not double numbers

# DS: Array
# ALGO:
# create a method that takes 1 integer arg
# CONVERT given integer into an array
# INIT a var, size for the array size (i.e. # of digits)
# RETURN given integer if size is odd
# INIT var, 'mid_point' to the value of size divided by 2...coding at this point...
def split_number(num, length)
  split_num = num.slice!(0, length)
  [split_num, num]
end

def double_number?(num1, num2)
  num1 == num2
end

def twice(integer)
  array = integer.digits
  size = array.size

  mid_point = size / 2
  first_num, second_num = split_number(array, mid_point)
  double_number?(first_num, second_num) ? integer : integer * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10

# Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.