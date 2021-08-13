# In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

# INPUT: an integer, 'year'
# - will always be a year greater than 0
# OUTPUT: boolean value
# - rep whether given year is a leap year or not
# - LEAP YEAR -
# -- a year evenly divisible by 4 unless also evenly divisible by 100
# -- if evenly divisible by both 4 & 100, it must be divisible by 400 to be considered a leap year
# DS: None
# ALGO
# 1. Create a method that takes 1 int arg, 'year'
# 2. DETERMINE is given input 'year' is a leap year or not
# -- DETERMINE --
# - - leap year if 'year' is evenly diviible by 4, 100, and 400
# - - leap year if 'year' is evenly divisible by 4 but not 100
# 3. Return true if it is, otherwise false

def evenly_divisible_4_100_400(year)
  (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)
end

def evenly_divisible_4_not_100(year)
  (year % 4 == 0) && (year % 100 != 0)
end

def leap_year?(year)
  evenly_divisible_4_100_400(year) ||
  evenly_divisible_4_not_100(year)
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end