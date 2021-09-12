# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

# INPUT: 2 arrays of the same length
# ? how to handle bad input? (i.e. nonArray)
# - negative numbers? empty arrays?
# OUTPUT: 1 array
# - each element is the product of elements from the input arrays at the same index

# DS: array
# ALGO:
# Create a method that takes 2 arg, 'array1', 'array2'
# Init a 'counter' to 0
# Create an empty array, 'multiplied_list'
# LOOP thru input arrays w/ counter retrieving the elements
#  - BREAK when counter is greater than or equal to the input array size minus 1
#  - multiply both elements & shovel product onto 'multiplied_list'
#  - increment 'counter' by 1
# RETURN 'multiplied_list'

def multiply_list(array1, array2)
  (array1.zip(array2)).map {|i| i.reduce(:*) } # FURTHER EXPLORATION; one liner using #zip

  # counter = 0
  # multiplied_list = []

  # loop do
  #   break if counter > array1.size - 1
  #   multiplied_list << (array1[counter] * array2[counter])
  #   counter += 1
  # end

  # array1.each_with_index do |num, idx|
  #   multiplied_list << (num * array2[idx])
  # end

  # counter = -1
  # array1.each_with_object([]) do |num, array|
  #   counter += 1
  #   array << (num * array2[counter])
  # end

  # multiplied_list
end


puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
puts multiply_list([10, 20, 30], [9, 10, 11]) == [90, 200, 330]
puts multiply_list([], []) == []