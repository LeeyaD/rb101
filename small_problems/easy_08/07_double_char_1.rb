# Write a method that takes a string, and returns a new string in which every character is doubled.

#Input: String
#- empty string returns an empty string
#Output: new String

# DS: Array
# ALGO
# - with input, string
# - separate into an array of chars
# - iterate thru array, for each char
# --- multiply char by 2 and add to a results string
# return results string

def repeater(string)
  results = ""
  str_array = string.chars
  
  str_array.each do |char|
    results << char * 2
  end
  
  results
end

# Examples:
puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
