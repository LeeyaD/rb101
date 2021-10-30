# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

# Input: a non-empty String
# ? - Raise an error for any non-empty string arg?
# Output: the middle character(s) of given string
# - incl. non-alphanumeric char

# DS: Array
# ALGO
# Create a method that takes a non-empty string
# SAVE result of dividing str length by 2, this is our index
# CONVERT string into an array of chars
# DETERMINE if string is even or odd in length
# - odd?
# --- return char from string located at that index
# - even?
# --- return two chars from string located; right before & at index

def center_of(string)
  return string if string.length == 1
  idx = string.length / 2

  center = if string.length.odd?
            string[idx]
           else
             string[(idx-1), 2]
           end
  center
end

puts center_of('I love ruby') == 'e'
# 11 length, 11/2 = 5, 'e' is at idx 5
puts center_of('Launch School') == ' '
# 13 length, 13/2 = 6, ' ' is at idx 6
puts center_of('Launch') == 'un'
# 6 length, 6/2 = 3, 'un' is at idxs 2-3
puts center_of('Launchschool') == 'hs'
# 12 length, 12/2 = 6, 'hs' at idxs 5-6
puts center_of('x') == 'x'