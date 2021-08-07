# Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck',
  'CAR', 'CAR'
]

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# Input: an array
# - no edge cases to handle
# Output: a print out of each element in the array alongside how many times the element occured in the array 
# Approach
# 1. Create an empty hash called 'occurances'
# INTERATE thru array arg, for each element
# - if it exists in the hash as a key, increment the value by 1
# - if it doesn't exist in the hash, add it as a key w/ a value of zero
# - ITERATE thru hash, puts'ing out the key-value pairs
def count_occurrences(array)
  occurances = {}
  array.each do |vehicle|
    if occurances.has_key?(vehicle.downcase)
      occurances[vehicle.downcase] += 1
    else
      occurances[vehicle.downcase] = 1
    end
  end
  occurances.each { |k, v| puts "#{k} => #{v}"}
end

count_occurrences(vehicles)
# Expected output:
# car => 6
# truck => 3
# SUV => 1
# motorcycle => 2