# What is the return value of the select method below? Why?
# [1, 2, 3] because the method selected every element it iterated over
# it relies on the return value of the block, if the block returns truthy the element in the current iteration is selected
# in the code below, the last code run is a string which is a truthy value

[1, 2, 3].select do |num|
  num > 5
  'hi'
end
