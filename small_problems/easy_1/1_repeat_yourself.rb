# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat(str, num)
  num.times { |s| puts str }
end

repeat('Hello', 3)

# Hello
# Hello
# Hello