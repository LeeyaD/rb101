# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# A:
# 1
# 2
# 3
# nil
# The puts method, in addition to calling to_s on its argument, writes each element on a new line if passed an array. That’s why the output appears as shown above.

# Additional note: had the last line been p numbers instead, the output would have been [1, 2, 2, 3] because the p method automatically calls inspect on its argument, which gives a different formatting on the output. Furthermore, we could have also done puts numbers.inspect and the output would have been the same as using the p method.