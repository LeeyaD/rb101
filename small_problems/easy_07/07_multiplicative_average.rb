# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

def show_multiplicative_average(array)
  divisor = array.size.to_f
  total = array.reduce(:*)
  average = (total / divisor).round(3)
  format("%.3f", average)
end

puts show_multiplicative_average([3, 5]) == "7.500"
puts show_multiplicative_average([6]) == "6.000"
puts show_multiplicative_average([2, 5, 7, 11, 13, 17]) == "28361.667"