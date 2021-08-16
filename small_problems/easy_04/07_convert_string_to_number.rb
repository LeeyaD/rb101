# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.
# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.
# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.
# You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

# pay attention to how many characters there are, 1000's, 100's, 10's, 1's placements
# => ['4', '3', '2', '1']

def string_to_integer(string)
  str_digits = '0123456789'
  str_arr = string.chars
  array = []
  str_arr.each do |char|
    array << str_digits.index(char)
  end
  return array[0] if array.size == 1
  results_array = []
  array.reverse.each_with_index do |num, idx|
    if idx == 0
      results_array.unshift(num)
    else
      results_array.unshift(num * (10 ** (idx)))
    end
  end

  results_array.sum
end

p string_to_integer('4321') == 4321
p string_to_integer('0') == 0
p string_to_integer('570') == 570