# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

#Input: String
#Output: new String
# - only consonants are doubled
# - all other characters (vowels, digits, punctuation, whitespace) should be ignored
# - case sensitive (i.e. "S" becomes "SS")

#DS: Array
#ALGO:
# with our input, string
# separate into an array of charscters
# iterate thru array & for each char:
# > DETERMINE if char is a consonant
# >  if yes, double & add to results array
# >  if no, add to results array as is
# > return results array
def consonant?(char)
  ("A".."z").include?(char) &&
  !(%w(a e i o u).include?(char))
end

def double_consonants(string)
  str_array = string.chars
  result = ""
  
  str_array.each do |char|
    if consonant?(char)
      result << char * 2
    else
      result << char
    end
  end
  
  result
end
# Examples:
puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""

