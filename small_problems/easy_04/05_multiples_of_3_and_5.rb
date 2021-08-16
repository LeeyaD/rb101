# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
# You may assume that the number passed in is an integer greater than 1.

# INPUT: an integer, 'num'
# - will be an integer greater than 1
# - don't have to account for bad input, negatives, or 0
# OUTPUT: an integer 'result'
# - the sum of all factors from 1 to the given input for 3 or 5

# ALGO
# 1. COUNT up from 1 thru the given arg (incl. the given arg)
# 2. For curr_element, DETERMINE if it's a factor of 3 or 5
# - DETERMINE - If the curr_elemenet can be divided evenly by 3 or 5 with no remainders
# 3. IF curr_element is a factor of 3/5 add it to an array
# - - ELSE do nothing
# 4. Return sum of the array


def multisum(number)
  result = (1..number).each_with_object([]) do |num, array|
             array << num if (num % 3 == 0) || (num % 5 == 0)
           end

  result.sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168