# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# INPUT: An array of strings
# ? How to handle nonArray or an Array of nonString elements?
# OUTPUT: An array of string
# - strings should be the same objects that were given
# - don't change casing (i.e 'YELLOW' > 'YLLW')
# ! if all the chars in a string are removed, an empty string should remain

# DS: Array
# ALGO
# 1. Create a method that takes 1 arg, 'array'
# 2. ITERATE thru the array; for current element:
# - - destructively replace vowels with an empty string
# - RETURNING 'array' transformed

def remove_vowels(array)
  array.map! do |string|
    string.gsub(/[aeiou]/i, "")
  end
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']