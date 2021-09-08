# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

# INPUT: an Array
# ? How to hand bad input? (i.e. non-Array input)
# OUTPUT: a pair of nested Arrays
# - 1st array contains first half of input arg
# - 2nd array contains second half of input arg
# ! if input arg contains an odd # of elements, middle element should be in first half of Array

# DS: Array
# ALGO
# 1. Create a method that takes 1 arg, 'array'
# 2. Set a var, 'num_elements', to the # of elements in the given 'array' divided by 2 but plus 1 if the array contains an odd number of elements
# 3. Create an empty 'results' array
# 4. Starting from the first element of the array and continuing 'num_elements' in length, shovel these elements into the 'results' away - MUTATE given 'array'
# 5. Shovel in mutated 'array'
# 6. Return 'results' array

def halvsies(array)
  half_arr = array.size / 2
  (half_arr += 1) if array.size.odd?

  results = []

  results << array.slice!(0, half_arr)
  results << array
  results
end


puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
