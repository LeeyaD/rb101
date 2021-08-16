# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# INPUT: an array of integers
# - ? how to handle bad input (i.e. not an array)?
# OUTPUT: an array of integers
# - each element is the running total from the original array, [2, 5, 13] -> [2, (2+5), (2+5+13)]
# - an empty array returns an empty array
# - ? return a new or original array?

# DS: an array
# ALGO
# 1. Create a method that takes an array of integers
# 2. Init a var called 'sum' to 0
# 3. Init a var called 'results_array' = []
# 4. Loop thru given array, for each element
# - - reassign 'sum' to itself + curr_element
# - - add 'sum' to the 'results_array'
# 5. Return results_array

# array.each do |num|
#   sum += num
#   results_array << sum
# end

# array.inject(0) do |sum, num| 
#   results_array << sum + num
#   sum + num
# end

def running_total(array)
  sum = 0

  array.each_with_object([]) do |num, arr|
    arr << sum += num
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([1, 2, -3]) == [1, 3, 0]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []