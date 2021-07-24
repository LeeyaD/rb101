# ask the user for 2 numbers
# ask for the type of operation to perform; add, subtract, divide, multiply
# perform the operation
# display result

puts "Welcome to the Calculator"

puts "What's your first number?"
num1 = gets.chomp.to_i

puts "What's your second number?"
num2 = gets.chomp.to_i

puts "What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

result = if operator == "1"
  num1 + num2
elsif operator == "2"
  num1 - num2
elsif operator == "3"
  num1 * num2
end

puts "The result is #{result}"