# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

# INPUT: an array
# - will always contain only numbers
# - will always contain at least 1 number
# OUTPUT: an array
# - rep. the sum of the sums of each leading subsequence
# - VOCAB, subsequence, a sequence starting from the first element (leading), that contains the first element, then each subsequent element one-by-one

# DS: Array
# ALGO:
# Create a method that takes 1 arg, 'array'
# Create an empty array, 'subsequences'
# FIND & SAVE subsequences as nested sub-arrays in 'subsequences'
#  - FIND - 
#  -- Init 2 var; 'start' & 'length'
#  -- Create a loop & for each iteration
#  -- - use 'start' & 'length' to slice a piece off of the given 'array', encapsulate this step in brackets and SHOVEL onto 'subsequences'
#  -- - increment 'length' by 1
#  -- - break loop when 'length' is greater than the given 'array's size
#  TRANSFORM each sub-array in 'subsequences' from integers to the sum of those integers
#  - TRANFORM -
#  -- iterate thru 'subsequences' & add all of the elemnts values
#  SUM 'subsequences' & RETURN result

def leading_subsequences(array)
  subsequences = []
  start = 0
  length = 1

  loop do
    sub_array = array.slice(start, length)
    subsequences << sub_array
    length += 1
    break if length > array.size
  end

  subsequences
end

def sum_of_sums(array)
  subs = leading_subsequences(array)
  sub_array_sum = subs.map(&:sum)
  sub_array_sum.sum
end

puts sum_of_sums([3, 5, 2]) == 21 #(3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == 36 # (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35