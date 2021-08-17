# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.
# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.
# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.
# You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

# pay attention to how many characters there are, 1000's, 100's, 10's, 1's placements
# => ['4', '3', '2', '1']

def convert_string_to_digits(string, str_digits)
  string.chars.map do |char|
    str_digits.index(char)
  end
end

def one_digit?(array)
  array.size == 1
end

def digits_to_numbers(digits)
  index = 0
  digits.reverse.each_with_object([]) do |num, array|
    if index == 0
      array.unshift(num)
    else
      array.unshift(num * (10 ** (index)))
    end
    index += 1
  end
end

def string_to_integer(string)
  str_digits = '0123456789'
  array = convert_string_to_digits(string, str_digits)

  return array[0] if one_digit?(array)
  digits_to_numbers(array).sum
end

p string_to_integer('4321') == 4321
p string_to_integer('0') == 0
p string_to_integer('570') == 570

# FURTHER EXPLORATION
# Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

def hexadecimal_to_integer(string)
  string.hex
end
p hexadecimal_to_integer('4D9f') == 19871