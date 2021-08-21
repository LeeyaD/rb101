# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# result = []

# arr.each do |hash|
#   hash_values = hash.values.flatten
#     if hash_values.all?(&:even?)
#       result << hash
#     end
# end

result = arr.select do |hash|
  hash_values = hash.values.flatten
  hash_values.all?(&:even?)
end
p result == [{e: [8], f: [6, 10]}]