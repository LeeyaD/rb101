# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# INPUT: an integer
# - how to handle non-integer, empty input?
# OUTPUT: message stating whether or not the 6th number appears amonth the first 5 numbers

#APPROACH | => ALGO
# 1. Ask use for a number, add number to a collection
# => Create a loop that prompts user for input & validates it to make sure it's a number (can accept negative and zero)
#  => valid_input? Add number to collection as-is (i.e. string format)
#  => valid_input false? print error message & ask again
# 2. Repeat #1, 6 times and on the 6th time don't add number to the collection
#  => Use a loop w/ a counter or #times and on the 6th or "5th" round, direct flow of code away from collection
# 3. Check to see if 6th number is already in the collection
#  => iterate thru array to see if 6th number is included
# 4. Print whether it is or isn't
#  => have 2 different messages print depending on result of check
# DS: Array
array = []
ORDINAL = { 1 => "st", 2 => "nd",
            3 => "rd", 4 => "th", 
            5 => "th", 6 => "last"}

def valid_number?(num)
  num.to_i.to_s == num
end

def prompt(ord)
  if ord == 6
    puts "==> Enter the last number:"
  else
    puts "==> Enter the #{ord}#{ORDINAL[ord]} number:"
  end
end

def get_number(ord)
  num = ""

  loop do
    prompt(ord)
    num = gets.chomp
    break if valid_number?(num)
    puts "That's not a valid number"
  end
  num.to_i
end

def get_last_number(arr)
  arr.pop
end

def searching(arr, number)
  if arr.include?(number)
    puts "The number #{number} appears in #{arr}."
  else
    puts "The number #{number} does not appear in #{arr}."
  end

end

6.times do |counter|
  array << get_number(counter+1)
end

final_number = get_last_number(array)
searching(array, final_number)
