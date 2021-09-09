# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# INPUT: an integer
# OUTPUT: a triangle
# RULES
# - explicit -
#  - input will always be positive, i.e. greater than 0
#  - output must be a right triangle
#   -- each side must each have input # of stars
#   -- the diagonal side should have one end in the lower-left and the other in the upper-right

# DS: N/A
# ALGO
# Create a method that takes one positive 'integer'
# Create a string w/ (blank * 'integer') # of blank spaces
# Counting up from 1 to given 'integer'
# - for each count, do 2 things
#  -- 1. reassign the char at the given 'integer' (negative) to a star
#  -- 2. print string

def triangle(integer)
  # results = " " * integer
  # 1.upto(integer) do |num|
  #   results[-num] = "*"
  #   puts results
  # end

  results = "*" * integer
  # integer.downto(1) do |num|
  #   puts results
  #   results[-num] = " "
  # end

  # (1..integer).each do |num|
  #   puts (" " * (integer - num)) + ("*" * num)
  # end

  # counter = 1
  # while counter <= integer
  #   results[-counter] = "*" # use results from line 22
  #   puts results
  #   counter += 1
  # end

  counter = 0
  # while counter < (integer - 1)
  #   results[counter] = " " # use results from line 28
  #   puts results
  #   counter += 1
  # end

  # loop do
  #   puts (" " * (integer - counter)) + ("*" * counter)
  #   counter += 1
  #   break if counter > integer
  # end

  loop do # use counter from line 45
    puts (" " * (counter)) + ("*" * (integer - counter))
    counter += 1
    break if counter > integer
  end
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****


triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********