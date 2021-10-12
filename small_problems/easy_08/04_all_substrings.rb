# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

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

def substrings(string)
  results = []
  
  loop do
    results << leading_substrings(string)
    string.slice!(0, 1)
    break if string.empty?
  end

  results.flatten
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]