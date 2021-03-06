# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(str)
  str == str.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# FURTHER EXPLORATION
# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. 
def palindromic_array?(arr)
  palindrome?(arr.join)
end

puts palindromic_array?([1, 2, 3, 4, 3, 2, 1]) == true
puts palindromic_array?(['a', 'B', 'C', 'B', 'a', 'd']) == false          # (case matters)
puts palindromic_array?([true, false, false, true, false, false]) == false # (all characters matter)

# Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.
def all_palindrome?(input)
  input.class == Array ? palindromic_array?(input) : palindrome?(input)
end


puts all_palindrome?('madam') == true
puts all_palindrome?('Madam') == false          # (case matters)
puts all_palindrome?("madam i'm adam") == false # (all characters matter)
puts all_palindrome?('356653') == true
puts all_palindrome?([1, 2, 3, 4, 3, 2, 1]) == true
puts all_palindrome?(['a', 'B', 'C', 'B', 'a', 'd']) == false          # (case matters)
puts all_palindrome?([true, false, false, true, false, false]) == false # (all characters matter)