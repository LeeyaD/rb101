# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(arr)
  return_array = []
  return arr if arr.size == 1
  arr.each_with_index do |e, idx|
    return_array << e if idx % 2 == 0
  end
  return_array
end

# FURTHER EXPLORATION
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
def oddities(arr)
  return_array = []
  return arr if arr.size == 1
  arr.each_with_index do |e, idx|
    return_array << e if idx % 2 != 0
  end
  return_array
end
puts oddities([2, 3, 4, 5, 6]) == [3, 5]
puts oddities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['def']
puts oddities([123]) == [123]
puts oddities([]) == []
# Try to solve this exercise in at least 2 additional ways.
def oddities(arr)
  return_array = []
  counter = 0
  return arr if arr.size == 1 || arr.empty?
  
  loop do
    current_element = arr[counter]
    return_array << current_element if counter % 2 == 0
    counter += 1
    break if counter > (arr.size-1)
  end
  return_array
end

def oddities(arr)
  return arr if arr.size == 1 || arr.empty?
  arr.select { |e| arr.index(e) % 2 == 0 }
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []