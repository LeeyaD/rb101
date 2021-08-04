# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# Input: a positive integer
# - no edge cases to worry about
# - if there were; bad input, no input
# Output: a string of alternating 1s and 0s
# - ALWAYS start w/ 1
# - length MUST match input
# APPROACH
# 1. Taking positive int arg
# 2. GOING from 0 to arg, CREATE a string of 1s and 0s (starting w/ 1) that goes on however long the count is
# -- GOING -> count up from 0 to the number before the arg
# -- CREATE -> ON COUNT 0 add a 1 to our output string, on count 1 add a 0 to our output string, keep going until we hit the number before our arg
# -- ON COUNT -> We'll know this based on our current idx
# -- - Idx starts at 0, so 0, 3, 5 (odd nums) will be 1s
# -- - 1, 2, 4 (even nums) will be 0s
# DS: string
# ALGO
# 1. Init an empty string 'output'
# 2. Use #upto to start from 1 to arg
# 3. Block -> if param is odd add a '1' to the output string, otherwise add a '0'
# 4. Return output string

def stringy(int, start = 1)
  output = ""
  1.upto(int) do |num|
    if start
      output << (num.odd? ? '0' : '1')
    else
      output << (num.odd? ? '1' : '0')
    end
  end
  output
end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# FURTHER EXPLORATION
puts stringy(5) == '01010'
puts stringy(8) == '01010101'
puts stringy(3) == '010'
puts stringy(6) == '010101'
