# Take a look at the following code:
name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.
# MY_ANSWER: "Alice" "Bob" - CORRECT

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
# What does this print out? Can you explain these results?
# MY_ANSWER: "BOB", "BOB" - CORRECT!