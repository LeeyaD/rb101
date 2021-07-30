# ask the user for 2 numbers
# ask for the type of operation to perform; add, subtract, divide, multiply
# perform the operation
# display result

# puts "Welcome to the Calculator"

# puts "What's your first number?"
# num1 = gets.chomp.to_i

# puts "What's your second number?"
# num2 = gets.chomp.to_i

# puts "What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
# operator = gets.chomp

# result = if operator == "1"
#   num1 + num2
# elsif operator == "2"
#   num1 - num2
# elsif operator == "3"
#   num1 * num2
# end

# puts "The result is #{result}"
# ---------REFACTORED CODE BELOW----------------------
def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_msg(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end
prompt "Welcome to the Calculator! Enter your name:"

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure you use a valid name."
  else
    break
  end
end

prompt "Hi, #{name}!"

loop do # main loop
  num1 = ""
  loop do
    prompt "What's your first number?"
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt "Hey! That's not a valid number."
    end
  end

  num2 = ""
  loop do
    prompt("What's your first number?")
    num2 = gets.chomp

    if valid_number?(num2)
      break
    else
      prompt "Hey! That's not a valid number."
    end
  end

  operator_prompt = <<-MSG
What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG
  prompt operator_prompt

  operator = ""
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include? operator
      break
    else
      prompt "Must choose 1, 2, 3 or 4"
    end
  end

  prompt("#{operation_to_msg operator} the two numbers...")
  sleep 2
  result = case operator
           when "1"
             num1.to_i + num2.to_i
           when "2"
             num1.to_i - num2.to_i
           when "3"
             num1.to_i * num2.to_i
           else
             num1.to_f / num2.to_f
           end

  prompt("The result is #{result}")

  prompt("Want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for calculating!")
