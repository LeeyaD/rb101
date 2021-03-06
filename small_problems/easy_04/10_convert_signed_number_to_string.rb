# In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

def integer_to_string(integer)
  if integer < 0
    integer = (integer / -1)
  end
    integer.digits.reverse.join
end

def signed_integer_to_string(integer)
  string = integer_to_string(integer)
  if integer > 0
    "+" + string
  elsif integer < 0
    "-" + string
  else
    string
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'