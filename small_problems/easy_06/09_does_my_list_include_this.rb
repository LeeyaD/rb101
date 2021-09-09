# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

# INPUT: 2 arguments, an Array and an Integer
# - Integer rep a 'search_value'
# OUTPUT: boolean
# - rep whether the given search value exists in the given array
# - true is it is in the array, otherwise, false
# RULES
# - explicit - 
#  - cannot use Array#include? in solution
#  - if search value is found in Array, return true
#  - if search value is not found in Array, return false
# - implicit -
#  - an empty array returns false whether the search value is an integer or 'nil'

# DS: array
# ALGO:
# 1. Create a method that takes 2 args; an 'array' and an integer ('search_value')
# 2. LOOP thru the 'array' & for each element:
#  - IF it matches the 'search_value' BREAK from loop & RETURN true
#  - ELSE at the end of the loop, BREAK & RETURN false
require 'pry'
require 'pry-byebug'

def include?(array, search_value)
  # for e in array do
  #   return true if e == search_value
  # end
  # false
  counter = 0
  
  while counter < array.size
    return true if array[counter] == search_value
    counter += 1
  end
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false