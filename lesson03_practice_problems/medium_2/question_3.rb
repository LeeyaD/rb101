# Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.
# Study the following code and state what will be displayed...and why:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" == "My string looks like this now: pumpkins" 
# When we pass 'my_string' to #tricky_method, the local var 'a_string_param' gets assigned to the same object 'pumpkins'. At this point BOTH variables point to the same object.
# The code on line 5, reassigns the local variable 'a_string_param' and points it to a different variable "pumpkins rutabaga"
# Meanwhile our variable 'my_string' remains un-mutated
puts "My array looks like this now: #{my_array}" #== "My array looks like this now: ["pumpkins", "rutabaga"]"
# When we pass 'my_array' to the same method, the local var 'an_array_param' gets assigned to the same object ['pumpkins']. At this point BOTH variables point to the same object.
# The code on line 6 mutates the called, the string 'rutabaga' gets shoveled into our array object (i.e. the string, gets added as another element)--the same one 'my_array' is pointing to.
# Therefore, our variable 'my_array' now looks like ["pumpkins", "rutabanga"]