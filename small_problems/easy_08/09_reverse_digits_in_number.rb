# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. 

# Input: Integer
# Output: Integer
# - digits in reverse order
# - digits ending in zeros will lose those zeros as we won't have leading zeros in our output

# DS: String
# ALGO
# Create a method that takes an int as an argument
# Convert entire int into a string
# Reverse the string
# Convert string into an integer
# Return int

def reversed_number(int)
  # string_int = int.to_s
  # rev_int = string_int.reverse.to_i
  # rev_int

  int.to_s.reverse.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1

# Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.