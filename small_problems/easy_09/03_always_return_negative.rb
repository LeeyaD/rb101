# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

# Input: Integer
# - num cna be positive, 0, or negative
# - how to handle bad input? (i.e. non Integer)
# - what if the number isn't an Integer?
# Output: Integer
# Rules:
# - if input is + output should be -
# - if input is 0 or - output should be the original # (i.e. the input)

# DS: none
# ALGO
# 1. Create a method that takes a number as an arg
# 2. DETERMINE is int is positive or not
# 2a. IF int is positive
#   -- return negative int
#     ELSE
#   -- return original input

def negative(num)
  num.positive? ? -(num) : num
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby