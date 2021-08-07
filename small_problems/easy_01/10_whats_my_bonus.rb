# Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

# Input: 2 arg; a positive int & a boolean
# - int will always be postive
# - how to handle decimals, bad input, no input
# Output: an integer
# - should be have of the positive int arg if given boolean arg is true
# - should be 0 if given boolean arg is false
# APPROACH
# 1. Taking 2 arg
# 2. If given boolean if true
# -- - return value of half the int arg
# -- If boolean is false
# -- - return 0

def calculate_bonus(salary, b)
  b ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
