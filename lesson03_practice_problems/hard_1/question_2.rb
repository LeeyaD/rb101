# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => "hi" - WRONG! ---> "hi there"

# O_O Why? because 'informal_greeting' was a reference to the original object!
# **remember it's all pass by reference, what matters is the method being called, that determines whether mutation happens or not!