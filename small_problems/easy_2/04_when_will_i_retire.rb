# Build a program that displays when the user will retire and how many years she has to work till retirement.
# Example:
# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# *HINT: Use the Time class from the ruby core library.
t = Time.new
puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

this_year = t.year
work_years = retirement_age - age
retirement_year = this_year + (work_years)


puts "It's #{t.year}. You will retire in #{retirement_year}."
puts "You have only #{work_years} years of work to go!"