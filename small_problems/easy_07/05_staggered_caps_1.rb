# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

# INPUT: a string
# ? how to handle bad input? (i.e. nonString)
# OUTPUT: a *new* string
# - starting with an upcase, every other letter is uppercase
# - remaining characters are lowercase
# - non-Alpha characters should remain unchanged but count when switching btwn upper & lower

# DS: Array
# ALGO
# Create a method that takes 1 arg, 'string'
# CONVERT string into an array, 'str_array'
# Init a 'counter' to 0
# Init an empty string, 'results'
# LOOP thru 'str_array'
# - use 'counter' to retrieve & transform element in 'str_array'
# - when 'counter' is even, upcase element
# - otherwise, downcase element
# - SHOVEL the upcased or downcased element onto the 'results' string
# - break iteration when end of array is reached
# RETURN 'results'

# def staggered_case(string)
#   str_array = string.chars
#   # idx = 0
#   results = ""
#   # loop do
#   #   break if idx > str_array.size - 1
#   #   results << (idx.even? ? str_array[idx].upcase : str_array[idx].downcase)
#   #   idx += 1
#   # end
#   # results

#   string.chars.each_with_index do |char, idx|
#     results << (idx.even? ? char.upcase : char.downcase)
#   end

#   results
# end


# puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
# puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# FURTHER EXPLORATION
def staggered_case(string, upcase = true)
  result = ''
  need_upper = upcase
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('I Love Launch School!', false) == 'i lOvE LaUnCh sChOoL!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ALL_CAPS', false) == 'aLl_cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts staggered_case('ignore 77 the 444 numbers', false) == 'iGnOrE 77 tHe 444 nUmBeRs'