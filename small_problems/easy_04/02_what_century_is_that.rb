# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# INPUT: a year (integer)
# - safe to assume no bad input (i.e. non-inters, negatives, or zero)
# OUTPUT: the century (string)
# - should begin with the centure number
# - should end with 'st', 'nd', 'rd', or 'th'

# DS: Hash for century endings
# ALGO
# 1. Create a method that takes an integer arg, 'year'
# 2. DETERMINE what century the year is in
# - DETERMINE -
# - - the years 1901-2000 comprise the 20th century
# - - the years 1801-1900 comprise the 19th
# - - 1701-1800 comprise the 18th
# - - 1601-1700 comprise the 17th
# - - 16th: 1501-1600
# - - 15th: 1401-1500
# - - 13th: 1201-1300
# - - 11th: 1001-1100
# - - 10th: 901-1000
# - - 9th: 801-900
# - - 7th: 601-700
# - - 5th: 401-500
# - - 3rd: 201-300
# - - 2nd: 101-200
# - - 1st: 1-100
# 3. Return a string, INTERPOLATING the century with the appropriate ending

def cent_ending(century)
  if (11..13).include?(century)
    'th'
  elsif century.digits[0] == 1
    'st'
  elsif century.digits[0] == 2
    'nd'
  elsif century.digits[0] == 3
    'rd'
  else
    'th'
  end
end

def century(year)
  if year.digits[0] == 0
    cent = year / 100
  else
    cent = (year / 100) + 1
  end
  "#{cent}" + cent_ending(cent)
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
# 1-2 digits, +1 to 0 || just 1
# 3 digits, +1 to first 1 digit
# 4 digits, +1 to first 2 digits
# 5 digits, +1 to first 3 digits
# 6 digits, +1 to first 4 digits