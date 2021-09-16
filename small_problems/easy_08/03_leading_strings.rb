# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest.

# INPUT: String
# OUTPUT: Array
# - el: substrings of given string, arranged in order from shortest to longest
# - VOCAB, substring - a sequence of characters starting from the beginning of the original string that increases in length by 1 character until the entire original string.
# - implicit - 
# arrangement of return value will occur naturally since we're starting w/ 1 char

# DS: Array
# ALGO:
# Create a method that takes 1 arg, 'string'
# Init an empty array, 'substrings'
# Init a var, 'start' to 0
# Init a var, 'length' to 1
# Using a LOOP, for each iteration
# - From the 'start' index of the given 'string' to 'length', store substring in 'substrings' array
# - Increment 'length' by 1
# - Break loop when 'length' is equal to the size of our given 'string'
# RETURN 'substrings'

def leading_substrings(string)
  substrings = []
  #length = 1
  
#  loop do
   # substrings << string.slice(0, length)
   # length += 1
   # break if length > string.size
#  end
  1.upto(string.size) do |idx|
  	substrings << string[0, idx]
  	end
  substrings
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']