# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def leading_substrings(string)
  substrings = []
  
  1.upto(string.size) do |idx|
  	substrings << string[0, idx]
  	end
  substrings
end

def palindrome?(string)
  string == string.reverse
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

def palindromes(string)
  array = substrings(string)
  
  array.select do |str|
    palindrome?(str) && str.size >= 2
  end
end

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# FURTHER EXPLORATION
# # Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

def leading_substrings(string)
  substrings = []
  
  1.upto(string.size) do |idx|
  	substrings << string[0, idx]
  	end
  substrings
end

def palindrome?(string)
  str = string.downcase
  str == str.reverse
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

def palindromes(string)
  new_string = string.gsub(/[^A-z0-9]/, '')
  array = substrings(new_string)
  
  array.select do |str|
    palindrome?(str) && str.size >= 2
  end
end


puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('mad-am') == ['madam', 'ada']
puts palindromes('mAD-am') == ['mADam', 'ADa']
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]