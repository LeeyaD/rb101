# keyword	meaning
# START	start of the program
# SET	sets a variable we can use for later
# GET	retrieve input from user
# PRINT	displays output to user
# READ	retrieve value from variable
# IF / ELSE IF / ELSE	show conditional branches in logic
# WHILE	show looping logic
# END	end of the program

# For example, write out pseudo-code (both casual and formal) that does the following:

# a method that returns the sum of two integers
#   pass in 2 interger arguments
#   add 2 integers together
#   return the result
#   FORMAL
#   SET 'result' to sum of 2 integers
#   RETURN 'result'
# -------------------------------------------
# a method that takes an array of strings, and returns a string that is all those strings concatenated together
#   pass in an array of strings
#   combine every string element in array together
#   - iterate thru array of strings
#     - for each iteration, add current element to a running string
#   return the result
#   FORMAL
#   SET 'final_string'
#   INTERATE thru array
#   - Add current element to final_string, and so on
#   - RETURN final_string
# -------------------------------------------

# a method that takes an array of integers, and returns a new array with every other element
#   pass in an array of integers
#   iterate thru array, with an index
#   - save every other element (the ones with an odd idx) in 'final_array'
#   return final array
#   FORMAL
#   SET 'final_array' as an empty array
#   ITERATE thru array WITH an index
#   - IF the current idx is odd
#     - add current element to final_array
#   - ELSE
#     - do nothing
#   END
#   RETURN final_array