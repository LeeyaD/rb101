# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

# INPUT: String
# ? How to handle bad input? (nonString)
# ? How to handle nonAlpha characters
# OUTPUT: String
# - all consecutive duplicate characters collapsed into a single character 
# - - ex. "ggg" -> "g"
# ! Can't use String#squeeze or String#squeeze!

# DS: array
# ALGO
# 1. Create a method that takes 1 arg, 'string'
# * Create an empty array, 'result'
# 2. ITERATE thru 'string' with an index, for current element
# - - IF it matches the character at the next index, do nothing
# - - ELSE, add it to the array
# 3. RETURN the array, joined back into a string

def crunch(string)
  result = []
  array = string.chars
  array.each_with_index do |char, idx|
    result << char if char != array[idx+1]
  end

  result.join
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('4444ab---cabccba') == '4ab-cabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''