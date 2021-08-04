# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# Input: an integer
# - can be positive, negative, or zero
# - will be a valid integer
# Ouput: Boolean value

# Approach: 
# 1. w/ Int arg, determine is it is even or odd
# 2. return true or false accordingly
# *DETERMINE - Can the Int arg be evenly divided by 2 w/ no remainder? i.e. Int arg % 2 == 0
# If so, return false
# DS: none

def is_odd?(num)
  #!(num % 2 == 0)
  !(num.remainder(2) == 0)
end


puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
# Keep in mind that you're not allowed to use #odd? or #even? in your solution.