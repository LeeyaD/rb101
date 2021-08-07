# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Examples:
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.

# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.
require 'pry'
VALID_OPS = %w(s p)
OPS = { 's' => 'sum', 'p' => 'product' }
numbers = []

def valid_number?(number)
  (number.to_i.to_s == number) && (number.to_i > 0)
end

def valid_operation?(op)
  VALID_OPS.include?(op)

end

def numbers_array(number, numbers)
  (1..number).each { |n| numbers << n }
end

def get_number
  num = ""

  loop do
    puts ">> Please enter an integer greater than 0:"
    num = gets.chomp.strip
    break if valid_number?(num)
    puts ">> Sorry that's not a valid number."
  end
  num.to_i
end

def get_operation
  op = ""
  loop do
    puts ">> Enter 's' to compute the sum, 'p' to compute the product."
    op = gets.chomp.strip.downcase
    break if valid_operation?(op)
    puts ">> Sorry that's not a valid operation."
  end
  op
end

def calculate(num, op, numbers)
  op == 's' ? numbers.inject(:+) : numbers.inject(:*)
end

number = get_number
numbers_array(number, numbers)
operation = get_operation
result = calculate(number, operation, numbers)
puts "The #{OPS[operation]} of the integers between 1 and #{number} is #{result}."



