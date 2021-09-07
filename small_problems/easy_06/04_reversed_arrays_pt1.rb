# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

#You may not use Array#reverse or Array#reverse!.

# INPUT: an Array
# OUTPUT: an Array
# - the same array object that was passed in, only mutated
# - the elements should be in reverse order, NOT reversed themselves
# - an empty array, returns an empty array

# ALGO
# Create a method that takes 1 arg, 'array'
# Create a duplicate array, 'dup_array'
# Create another counter, 'rev_counter' initialized to 0
# ITERATE thru 'array' destructively & for each element/iteration
# - increment 'rev_counter' minus 1
#  - TRANSFORM it with the element from 'dup_array'
#  - - retrieving & returning from the block, the element at 'rev_counter' index in 'dup_array' 

def reverse!(array)
  dup_array = array.dup
  counter = 0

  array.map! do |_|
    counter -= 1
    dup_array[counter]
  end
end

# def reverse!(array)
#   dup_array = array.dup
#   counter = 0
#   index = -1

#   loop do
#     break if counter > (array.size - 1)
#     array[counter] = dup_array[index]
#     index -= 1
#     counter += 1
#   end
#   array
# end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true

list = [[1, 2], ["a", "b"], true]
puts reverse!(list) == [true, ["a", "b"], [1, 2]]