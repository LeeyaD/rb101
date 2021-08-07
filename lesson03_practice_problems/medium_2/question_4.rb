# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.


def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" == "My string looks like this now: pumpkinsrutabaga"
# When we pass 'my_string' to #tricky_method_two, the local var 'a_string_param' gets assigned to the same object 'pumpkins'. At this point BOTH variables point to the same object.
# The code on line 5, gets shoveled onto our String object, since this method is mutating, our variable 'my_string' now has a value of 'pumpkinsrutabaga'
puts "My array looks like this now: #{my_array}" #== My array looks like this now: ["pumpkins"]
# When we pass 'my_array' to the same method, the local var 'an_array_param' gets assigned to the same object ['pumpkins']. At this point BOTH variables point to the same object.
# The code on line 6 reassigns the local variable 'an_array_param' and points it to a different array object
# Therefore, our variable 'my_array' remains unchanged