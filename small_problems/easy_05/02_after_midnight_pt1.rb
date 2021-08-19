# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.
# Disregard Daylight Savings and Standard Time and other complications.
# ---------------------------------------------------------------
# INPUT: any integer
# - rep: minutes
# - positive # = minutes after midnight
# - negative # = minutes before midnight
# OUTPUT: a string
# - rep: the time in 24-hr format (hh:mm)
# RULES:
# - cannot use Ruby's DATE & TIME classes
# - ignore Daylight Savings, Standard Time, etc.

# HINT
# - Integer#divmod method and % (modulo) operator will be useful.
# - Kernel#format for formatting your results.
# - Try solving this problem for non-negative arguments between 0 and 1439 first. 
# - Then, arguments greater than 1439. 
# - Finally, solve it for negative values. 
# - Think about how you might be able to simplify the final two parts. 
# ! One day is 1440 minutes

# DS: Don't know
# Approach
# 1. Create a method that takes any integer as an arg, 'minutes'
# 2. DETERMINE whether 'minutes' is between 0 and 1439 or greater than 1439
# 3. IF minutes is between 0 and 1439
# - - -DETERMINE the hour & minutes
# -- -- Integer#divmod(60) returns an array of 2 elements; 1st is the hour, 2nd is the minutes
# -- ESLIF time is greater than 1439
# - - -DETERMINE hour & minutes
# -- -- 
# 5. RETURN an interpolated string with the hour & minutes formated w/ Kernel#format
MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

def time_of_day(minutes)
  minutes += MINUTES_PER_DAY if minutes < 0

  days, minutes = minutes.divmod(MINUTES_PER_DAY)
  hours, min = minutes.divmod(MINUTES_PER_HOUR)

  "#{format("%02d", hours)}:#{format("%02d", min)}"
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"