# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

(1..99).each {|n| puts n if n.even? }

1.upto(99) {|n| puts n if (n % 2 == 0) }

array = []
numbers = (1..99).select { |n| n.even? }
puts numbers