# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# def oddities(arr)
#   return_array = []
#   arr.each_with_index do |e, idx|
#     return_array << e if idx % 2 == 0
#   end
#   return_array
# end
require 'pry'
require 'pry-byebug'
# Further Exploration
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
# Try to solve this exercise in at least 2 additional ways.

def oddities(arr)
  counter = 0
  return_array = []
  while counter == (arr.size - 1)
    return_array << arr[counter] if counter % 2 == 0
    counter += 1
    binding.pry
  end
  return_array
  binding.pry
end

puts oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) #== [1, 3, 5]
puts oddities(['abc', 'def']) #== ['abc']
# puts oddities([123]) == [123]
# puts oddities([]) == []