# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# INPUT: a string
# - 1+ space separated word
# - non-alphabetical characters included
# * Empty string returns an empty hash
# ? How to handle bad input (i.e. nonStrings)
# OUTPUT: a hash
# - keys are the word length & values are the # of occurences
# * non-alphabetical characters are counted in word length

# DS: Array
# ALGO
# 1. Create a method that takes 1 arg, 'string'
# 2. SPLIT string, by 1 space, into an array of words 'array'
# 3. Create a new array, 'lengths' where the integer elements are the lengths of the words
# 4. ITERATE thru 'lengths' array, creating a hash
#  - - curr_element, 'length' is the hash key and the value is how many times it occurs in the 'lengths' array
# 5. Return hash

def word_sizes(string)
  lengths = string.split.map { |word| word.length }
  lengths.each_with_object({}) do |length, hash|
    hash[length] = lengths.count(length)
  end
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes("What's   up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}