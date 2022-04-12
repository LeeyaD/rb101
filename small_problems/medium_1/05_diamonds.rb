=begin
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

input: an odd integer
output: a 4-pointed diamond in an n X n grid
- n is the input

ALGO
- Create a method that takes 1 arg, an odd integer
- For the given number (input) of times:
-- 
=end

def diamond(odd_num)
  d = 1
  flag = false
  
  odd_num.times do
    spaces = " " * ((odd_num - d) / 2)
    puts spaces + ("*" * d) + spaces
    flag ? (d -= 2) : (d += 2)
    flag = true if d == odd_num
  end
end

diamond(1)
# *

diamond(3)

#  *
# ***
#  *

diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *



# hollowed out diamonds
def diamond(odd_num)
  d = 1
  flag = false
  
  odd_num.times do
    spaces = " " * ((odd_num - d) / 2)
    diamonds = " " * d
    diamonds[0] = "*"
    diamonds[-1] = "*"
    
    puts spaces + diamonds + spaces
    flag ? (d -= 2) : (d += 2)
    flag = true if d == odd_num
  end
end