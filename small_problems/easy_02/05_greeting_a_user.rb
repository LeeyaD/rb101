# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

def yell(str)
  str.delete!("!")
  "#{greet(str).upcase}" + " WHY ARE WE SCREAMING?"
end

def greet(str)
  "Hello #{str}."
end

def greeting(name)
  puts name.include?("!") ? yell(name) : greet(name)
end

puts "What is your name?"
name = gets.chomp

greeting(name)


