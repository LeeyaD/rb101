# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

# Input: String
# ? - How to handle 1+ consecutive space?
# Output: An Array of words (given String separated) with 1 space and the word length appended to each word in the array.

# DS: Array
# ALGO: 
# create a method that takes a string arg
# CONVERT string into an array of words, word_array, each word is delimited by a space
# ITERATE thru 'word_array', for each word:
# - DETERMINE the word size, 'size'
# - ADD a space and 'size' to the end of the word
# RETURN the array

def word_lengths(string)
  arr = string.split(" ")
  arr.map do |word|
    size = word.size
    word + " #{size}"
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []