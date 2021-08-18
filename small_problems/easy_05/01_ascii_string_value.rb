# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

# INPUT: a string
# - can be of any length, even empty
# ? how to handle non-string input?
# OUTPUT: an integer
# - sum of the ASCII values of every character in the string

# DS: array
# ALGO
# 1. SEPARATE given string into an array
# - SEPARATE => String#chars
# 2. TRANSFORM array elements into their respective ASCII values
# - TRANSFORM => Array#map!
# 3. RETURN the sum of the array

def ascii_value(string)
  string.chars.map! { |char| char.ord }.sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0