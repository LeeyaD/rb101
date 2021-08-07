# Depending on a method to modify its arguments can be tricky:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.
# How can we change this code to make the result easier to predict and easier for the next programmer to maintain?
# 1. Make two separate methods & name them better?
# expand the ruby syntax on line 3 so it reads a_string_param = a_string_param + "rutabaga"
# - rather than use Ruby's syntactic sugar, use #concat, a_string_param.concat("rutabaga")
# rather than use Ruby's syntatic sugar, use a clearer method #push, an_array_param.push("rutabaga")