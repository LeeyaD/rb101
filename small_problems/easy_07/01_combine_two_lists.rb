# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# INPUT: 2 arrays
# OUTPUT: 1 array
# RULES
#  - explicit -
#  -- both input arrays are non-empty
#  -- both inpur arrays contain the elements taken in alternation (i.e. [1, 2], ["a", "b"] => [1, "a", 2, "b"])

# DS: array
# ALGO:
# Create a method that takes 2 arg, 'array1' & 'array2'
# Init an empty array, 'results'
# LOOP through one array, for current element
#  - shovel curr_element onto results array, then
#  - shovel first element from 2nd array (destructively) onto results too
# RETURN results array

def interleave(array1, array2)
  # results = []
  # array1.each do |e|
  #   results << e
  #   results << array2.shift
  # end
  # results

  # while !array1.empty? && !array2.empty?
  #   results << [(array1.shift), (array2.shift)]
  # end
  # results.flatten

  (array1.zip(array2)).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']