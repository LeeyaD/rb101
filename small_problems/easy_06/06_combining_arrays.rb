# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

# INPUT: 2 arrays
# ? How to handle bad input?
# ? - error message? an empty array?
# OUTPUT: 1 array
# - contains all of the values from both argument Arrays
#  - no duplication in values, even if there's dupes in the original Arrays

def merge(array1, array2)
  (array1 + array2).uniq
end

puts merge(["a", "b", "c"], ["b", "c", "d"]) == ["a", "b", "c", "d"]
puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
puts merge([true], [false]) == [true, false]
puts merge([0, 9], [0, 9]) == [0, 9]
puts merge([], []) == []