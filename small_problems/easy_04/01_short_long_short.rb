# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# INPUT: 2 string args
# - can assume arg will always be a string
# - arg can be an empty string
# - one string will be longer than the other
# OUTPUT: 1 string
# - the concatenation of the string args: short+long+short
# - no spaces in output
# - an empty str arg results in returning the other arg

# DS: None
# ALGO
# 1. Create #short_long_short that takes 2 string arguments, string 1/string2
# 2. IDENTIFY which string is long and which is short
# - IDENTIFY - #identify_strings(string)
# - - save string1 to a variable, long_str, if it's size is greater than string 2 or vice versa
# 3. Return the result of concatenating the short long and then short string

def short_long_short(str1, str2)
  long, short = if str1.size > str2.size
                  [str1, str2]
                else
                  [str2, str1]
                end
  short + long + short
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
