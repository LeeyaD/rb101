# What happens when we modify an array while we are iterating over it? What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
# p numbers
# 1st: p 1 / [2, 3, 4]
# 2nd: p 3 / [2, 4]
# Output - CORRECT
# 1
# 3
# numbers => [2, 4] - WRONG > [3,4]


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
p numbers
# 1st: p 1 / [1, 2, 3]
# 2nd: p 2 / [1, 2]
# Output: - CORRECT
# 1
# 2
# numbers => [1, 2] - CORRECT