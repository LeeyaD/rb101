# In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
          "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9,
          "-" => :- }


def convert_string_to_digits(string)
  str_array = string.chars
  remove_plus_sign(str_array)

  str_array.map do |char|
    DIGITS[char]
  end
end

def remove_plus_sign(array)
  array.shift if array[0] == "+"
end

def one_digit?(array)
  array.size == 1
end

def negative_number?(element)
  element == :-
end

def get_number(digits)
  number = 0

  (digits.size - 1).times do |idx|
    number = 10 * (number + digits[idx])
  end
  number += digits[-1]
end

def digits_to_numbers(digits, negative = false)
  digits.shift if negative
  
  if negative
    -get_number(digits)
  else
    get_number(digits)
  end
end

def string_to_signed_integer(string)
  array = convert_string_to_digits(string)
  
  return array[0] if one_digit?(array)
  digits_to_numbers(array, negative_number?(array[0]))
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
