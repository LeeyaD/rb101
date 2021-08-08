# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# Example
def print_operation(num1, num2)
  puts "===> #{num1} + #{num2} = #{num1+num2}"
  puts "===> #{num1} - #{num2} = #{num1-num2}"
  puts "===> #{num1} * #{num2} = #{num1*num2}"
  puts "===> #{num1} / #{num2} = #{num1/num2}"
  puts "===> #{num1} % #{num2} = #{num1%num2}"
  puts "===> #{num1} ** #{num2} = #{num1**num2}"
end

puts "==> Enter the first number:"
num1 = gets.chomp.to_i
puts "==> Enter the second number:"
num2 = gets.chomp.to_i

print_operation(num1, num2)

# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103