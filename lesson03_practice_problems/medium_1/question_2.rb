# The result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?
# => TypeError can't add an integer to a string
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{(40 + 2)}" 