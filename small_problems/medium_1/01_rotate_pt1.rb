# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# input: an array
# output: an array
# ? how to handle an empty array?
# - return an empty array? return nil? raise error?

# DS: array 
# ALGO
# 1. Create a method that takes 1 arg, an array
# 2. Move the element at index 0 of the given array, i.e. first place, to the end of the array (idx -1)
# 3. Original array should be unmodified

def rotate_array(array)
  array_dup = array.clone
  array_dup << array_dup.shift
end

# LS
def rotate_array(array)
  array[1..-1] + [array[0]]
end


p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
