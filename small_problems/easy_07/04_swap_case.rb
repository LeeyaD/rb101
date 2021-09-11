# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# INPUT: a string
# - any length
# - letters & non-alpha characers
# ? how to handle bad input (i.e. not String)
# OUTPUT: a NEW string
# - alphabetic characters' cases swapped (upper to lower & vice versa)
#  -- "U" > "u", "y" > "Y"
# - all non-alpha characters remain unchanged

# DS: Array
# ALGO
# Create a method that takes 1 arg, 'string'
# CONVERT string into an array of characters, 'str_array'
#  -- CONVERT -- by each character
# ITERATE thru 'str_array' & for each character
#  -- ITERATE -- use #map since we want a NEW string returned
# - DETERMINE if current_char is uppercase
# -- determine --> does the character appear in a range of uppercase letter (A-Z)
#  - IF yes, then make it lowercase
#  - IF not, make it uppercase
# RETURN new string

def swapcase(string)
  # string.chars.map do |char|
  #   ("A".."Z").include?(char) ? char.downcase : char.upcase
  # end.join
  
  results = ""
  # string.chars.each do |char|
  #   results << (("A".."Z").include?(char) ? char.downcase : char.upcase)
  # end
  
  str_array = string.chars
  counter = 0
  loop do
    break if counter > str_array.size - 1
    if ("A".."Z").include?(str_array[counter])
      results << str_array[counter].downcase
    else
      results << str_array[counter].upcase
    end
    counter += 1
  end

  results
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase(' ') == ' '
puts swapcase('') == ''
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'