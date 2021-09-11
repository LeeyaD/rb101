# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# INPUT: a string
# OUTPUT: a new string
# - firt letter of every word capitalized and all other letters lowercase
# - words: any sequence of non-blank characters
# - one letter characters 'a' are considered words
# - non-alpha characters that appear first in a word count
#  - e.g. "quoted" => "quoted" NOT "Quoted"
# ? How to handle empty strings?

# DS: array
# ALGO
# Create a method that takes 1 arg, 'string'
# CONVERT 'string' into an array of words, on their spaces, 'str_array'
# ITERATE thru 'str_array', for each word
#  - capitalize word
# Make the iteration the last line of code run so the new string will be returned
# * CONVERT 'str_array' back to a string by chaining a method on the end

# def word_cap(string)
#   # str_array = string.split
#   # str_array.map do |word|
#   #   word.capitalize
#   # end.join(" ")

#   # str_array.map(&:capitalize).join(" ")
#   string.split.map(&:capitalize).join(" ")
# end

# FURTHER EXPLORATION: Don't use Array#capitalize or Array#capitalize!
# ALGO
# Create a method that takes 1 arg, 'string'
# CONVERT 'string' into an array of words, on their spaces, 'str_array'
# ITERATE thru 'str_array to transform each word
# - upcase the first letter

def capitalize_word(word)
  word.chars.map do |l|
    word[0] == l ? l.upcase! : l.downcase!
    l
  end.join
end

def word_cap(string)
  str_array = string.split
  str_array.map do |word|
    capitalize_word(word)
  end.join(" ")
end


puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


