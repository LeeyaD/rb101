# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

# You may assume that the argument is always greater than or equal to 2.

# INPUT: an integer
# - the # of digits for the fibonacci # we're looking for
# - safe to assume the arg is always >= 2
# OUTPUT: an integer
# - the index of the fibonacci # we're looking for

# DS: Array
# ALGO
# 1. Create a method that takes 1 arg, 'length'
# 2. Create a 'fibonacci' helper method that counts the fibonacci sequence & returns number as it counts
# * save number in an 'array'
# 3. Determine if the length of the current fibonacci # is the same as the given argument, if it is stop counting
# 4. Find the current fibonacci # that stops the counting and return it's index from the 'array' it's stored in

# ALGO
# 1. Create a method that generates the fibonnaci sequence
# 2. Create an array 'fibonacci' of 2 elements, one's
# 3. Shovel the sum of the last 2 elements of 'fibonacci' onto itself
#  - reference & add together 'fibonacci[-1]' & 'fibonacci[-2]'
# 4. Stop counting when the length of the # being shoveled on matched the given length

def find_fibonacci_index_by_length(length)
  # fibonacci = [1, 1]
  # loop do
  #   fibonacci << (fibonacci[-1] + fibonacci[-2])
  #   break if (fibonacci[-1].digits.size) == length
  # end
  # fibonacci.size

  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= length

    first = second
    second = fibonacci
  end

  index
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847