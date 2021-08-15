# The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

# ALGO
# 0. Create a method that takes an integer, 'year'
# 1. DETERMINE is given year is under the Gregorian or Julian calendar
# - DETERMINE - 
# - - IF year is prior to 1752 (i.e. 1 to, and including 1752), year under Julian calendar
# - - ELSE year is under Gregorian calendar
# 2. IF year is under Gregorian calendar run code from previous exercise,
# -- ELSE, DETERMINE Julian calendar leap year
# - DETERMINE -
# - - IF year is divisible by 4, return true
# - - ELSE, return false


def evenly_divisible_4_100_400(year)
  (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)
end

def evenly_divisible_4_not_100(year)
  (year % 4 == 0) && (year % 100 != 0)
end

# def gregorian_leap_year?(year)
#   evenly_divisible_4_100_400(year) ||
#   evenly_divisible_4_not_100(year)
# end

def julian_leap_year?(year)
  year % 4 == 0
end

def leap_year?(year)
  if year >= 1752
    gregorian_leap_year?(year)
  else
    julian_leap_year?(year)
  end
end

def gregorian_leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

#LS's solution
def leap_year?(year)
  if year >= 1752
    gregorian_leap_year?(year)
  else
    julian_leap_year?(year)
  end
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
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true