# What is the block's return value in the following code? 
# => a boolean
# How is it determined? 
# => by running the last line of code in the block
# Also, what is the return value of any? 
# => a boolean value
# in this code and what does it output?
# => true
# output => 1, 2, 3 - WRONG, only 1 & it stops iterating

p ([1, 2, 3].any? do |num|
  puts num
  num.odd?
end)