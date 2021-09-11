# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# INPUT: string
# - any length, even empty
# OUTPUT: hash
# - 3 key-value pairs counting 'lowercase', 'uppercase', 'neither' (all other characters)
# - an empty string should return the hash with zeros
# - spaces count as neither
# ? - how to hand bad input? (i.e. not a string)

# DS: Array & Hash
# # ALGO
# Create a method that takes 1 arg, 'string'
# Create a hash, 'case_counter' with 3 keys; 'lowercase', 'uppercase', and 'neither' all with values of 0
# CONVERT 'string' to an array, 'str_array'
# ITERATE thru 'str_array', for each character
#  - IF it's lowercase, increment the 'lowercase' key in 'case_counter' by one
#  - ELSIF it's uppercase, increment the 'uppercase' key in 'case_counter' by one
#  - otherwise, increment the 'neither' key in 'case_counter' by one
# RETURN case_counter

def letter_case_count(string)
  # case_counter = { lowercase: 0, uppercase: 0, neither: 0 }
  # str_array = string.chars
  
  # str_array.each do |char|
    # if char.match?(/[a-z]/)
    #   case_counter[:lowercase] += 1
    # elsif char.match?(/[A-Z]/)
    #   case_counter[:uppercase] += 1
    # else
    #   case_counter[:neither] += 1
    # end
  # end

  case_counter = {}
  case_counter[:lowercase] = string.count("a-z")
  case_counter[:uppercase] = string.count("A-Z")
  case_counter[:neither] = string.count("^A-z")

  case_counter
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('Ab   +Ef') == { lowercase: 2, uppercase: 2, neither: 4 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
puts letter_case_count('     ') == { lowercase: 0, uppercase: 0, neither: 5 }