# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

puts "Please write word or multiple words:"
word = gets.chomp.strip
characters = word.delete(" ")
number_of_chars = characters.length
puts "There are #{number_of_chars} characters in \"#{word}\"."

# output: There are 4 characters in "walk".
# output: There are 13 characters in "walk, don't run".