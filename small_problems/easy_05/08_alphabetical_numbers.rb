# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# INPUT: an array of Integers
# - Integers will be from 0 to 19
# OUTPUT: an array of Integers
# - sorted alphabetically by the word for them in English

# DS: Hash & Array
# ALGO
# 1. Create a method that takes 1 arg, 'array'
# 2. Create a hash; keys are Integers, values are the keys' English words
# 3. ITERATE thru 'array' & destructively transform each Integer into it's English word
# - - For current element, 0, use as a key to return the hash value, "zero"
# 4. Destructively sort transformed 'array' alphabaetically
# 5. ITERATE thru sorted/transformed 'array' & transform it back to Integers
# - - For current element, 'eight' & use to return the corresponding hash key
# 6. Transformational method will return the result

ALPHA_NUMERIC = {
  1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 
  8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 
  14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 
  19 => "nineteen", 0 => "zero"
}

def alphabetic_number_sort(array)
  # array.map! { |num| ALPHA_NUMERIC[num] }
  # array.sort!.map! { |word| ALPHA_NUMERIC.key(word) }

  array.sort_by { |num| ALPHA_NUMERIC[num] }
end


puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]