# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.
def palindrome?(str)
  str == str.reverse
end

def palindromic_number?(numbers)
  string = numbers.to_s
  palindrome?(string)
end

# FURTHER EXPLORATION
# Suppose your number begins with one or more 0s. 
# 1. Will your method still work? Why or why not? 
#  - No, because leading zeros is a special case.
# 2. Is there any way to address this?
#  - I don't know and don't want to go down a rabbit hole...

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(34543) == true
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true