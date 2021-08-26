# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.
# Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.
# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"

# INPUT: Floating point, 'angle'
# OUTPUT: String
# - rep. the 'angle' in degrees-minutes-seconds
# - use degree symbol (°) for degrees, single quote (') for minutes, and double quote (") for seconds
# ! results may differ slightly depending on how you round values, but should be within a second or two of the results shown.
# ! Use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

# HOW TO CALCULATE
# The whole units of degrees will remain the same (e.g., if your figure is 121.135 degrees longitude, start with 121 degrees).
# Multiply the decimal portion of the figure by 60 (e.g., .135 * 60 = 8.1).
# The whole number becomes the minutes (8).
# Take the remaining decimal and multiply it by 60 (e.g., .1 * 60 = 6).
# The resulting number becomes the seconds (6 seconds). Seconds can remain as a decimal if needed.
# Take your three sets of numbers and put them together, (e.g., 121°8'6" longitude would be equivalent to 121.135 degrees longitude).

# DS: Array
# ALGO
# 1. Create a method that takes 1 arg, a floating point, 'angle'
# 2. CONVERT 'angle' into a string & separate by decimal into a 2-element 'array' (1st el: degrees, 2nd: decimal portion)
# * Create an empty string, 'result'
# 3. REMOVE 1st element from 'array' & APPEND it to 'results' string followed by our interpolated constant DEGREE
# 4. CONVERT remaining element in 'array' into an integer & multiply it by 0.01, then 60
# 5. GRAB element, CONVERT to a string & separate by decimal into a 2-element 'array'
# 6. Repeat step 2, APPENDing to 'results' followed by a single quote (') **format("%0.2d", [element])
require 'pry'
require 'pry-byebug'
def degrees(arr, string)
  string << arr.shift + DEGREE
end

def minutes(arr, string)
  binding.pry
  if arr.empty?
    string << "00'"
  else
    arr = ((arr[0].to_i * 0.01) * 60).to_s.split(".")
    string << format("%0.2d", arr.shift) + "'"
  end
  # p string
end

def dms(angle)
  result = ""
  array = angle.to_s.split(".")
  degrees(array, result)
  minutes(array, result)
end

# puts dms(30) #== %(30°00'00")
# puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
# puts dms(0) #== %(0°00'00")
# puts dms(360) #== %(360°00'00") #|| dms(360) == %(0°00'00")



