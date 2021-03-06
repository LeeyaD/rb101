# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

# def reverse(array)
#   dup_array = array.dup
#   counter = 0

#   array.map do |_|
#     counter -= 1
#     dup_array[counter]
#   end
# end

# def reverse(array)
#   results = []
#   counter = -1

#   loop do
#     break if array[counter] == nil
#     results << array[counter]
#     counter -= 1
#   end
#   results
# end

def reverse(array)
  idx = -1
  array.each_with_object([]) do |e, arr|
    arr.unshift(e)
  end
end

puts reverse([1,2,3,4]) == [4,3,2,1]        # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)# => true
puts reverse(['abc']) == ['abc']            # => true
puts reverse([]) == []                      # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true