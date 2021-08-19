# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# INPUT: a string
# - letters are all lowercased
# - incl. non-alphabetic characters
# OUTPUT: a string
# - original string
# - all non-alphabetic characters replaced by spaces
# - 1+ non-alpha char in a row != consecutive spaces, only 1

# DS: Array
# ALGO
# 1. Create a method that take 1 arg, 'string'
# 2. REPLACE all non-alpha elements w/ spaces
# 3. REPLACE all consecutive spaces w/ 1 space


def cleanup(string)
  string.gsub!(/[^A-z]/, " ")
  string.gsub!(/\s{2,}/, " ")
end

puts cleanup("---what's my +*& line?") == ' what s my line '