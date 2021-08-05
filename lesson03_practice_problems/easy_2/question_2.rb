# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."
# Convert the string in the following ways (code will be executed on original munsters_description above):


# flip case; caps get downcases & vice versa
puts munsters_description.swapcase == "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

# Only the first letter of the string gets capitalized
puts munsters_description.capitalize == "The munsters are creepy in a good way."

puts munsters_description.downcase == "the munsters are creepy in a good way."

puts munsters_description.upcase == "THE MUNSTERS ARE CREEPY IN A GOOD WAY."