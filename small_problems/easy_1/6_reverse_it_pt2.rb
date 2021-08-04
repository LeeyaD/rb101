# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# Input: a string
# - can be 1+ words of any character length
# - Edge cases, how to handle...bad input, an empty string
# Output: a string
# - words w/ 5+ characters revered
# - spaces left included only when more than 1 word is present
# Approach => Algo
# 1. Take str arg & REVERSE words w/ 5+ characters
# - REVERSE
# -- a. *break str apart by word* (i.e. white space) into an array => #split
# -- b. *ITERATE thru array* & *identify* words with 5+ char => #map, #length
# -- - if 5+ chars > reverse word, otherwise, leave alone
#** have to join them back together!
# 2. Return reversed str

def reversable?(word)
  word.length >= 5
end

def reverse_words(str)
  str.split.map do |word|
    reversable?(word) ? word.reverse : word
  end.join(' ')
end

puts reverse_words('Professional') == "lanoisseforP"
puts reverse_words('Professional  ') == "lanoisseforP"
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School') == "hcnuaL loohcS"
