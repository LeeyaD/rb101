# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# 1. what is != and where should you use it?
# an equality operator that returns true if the operands on either side are not equal and false if they are equal

# 2. put ! before something, like !user_name
# our bang operator makes our object evaluate to the opposite boolean value of whatever it would have originally
# !true evaluates to false

# 3. put ! after something, like words.uniq!
# the bang operator at the end of a method is a common indicator that the method mutates the caller however not all methods that end in the bang operator mutate their caller

# 4. put ? before something
# nothing would happen, except maybe an error being raised about incorrect syntax

# 5. put ? after something
# with a space and : present, we get a ternary operator that evaluates the code before the '?' and depending on the boolean value it evaluates to, either runs the code before the ':'' if true or after the ':' if false

# 6. put !! before something, like !!user_name
# the double bang operator returns the boolean value of the object it comes before