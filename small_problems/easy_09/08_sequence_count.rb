# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

# Input: the count & the first number (both integers)
# - the count, always have a value of >=0
# - first number, any integer value (positive & negative)
# ? handle floats?

# Output: an array
# - containing the same number of elements as 'the count' argument
# - each element is a multiple of the starting number

# Notes
# if first arg, count == 0, output should be []

# DS: array
# ALGO
# 1. Create method that takes 2 args; 'count' & 'first_num'
# 2. Init. var 'counter' to 1
# -. Init an empty array, 'sequence'
# 3. Until 'sequence' size is >= 'count'
# 4. - multiple 'counter' by 'first_num' and add number to 'sequence' array
#    - increment counter by 1
# 5. Return 'sequence' array

# def sequence(count, first_num)
#   sequence = []
#   counter = 1
  
#   until sequence.size >= count
#     sequence << (counter * first_num)
#     counter += 1
#   end
#   sequence
# end

def sequence(count, first_num)
  Array.new(count) { |num| first_num * (num + 1) }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []