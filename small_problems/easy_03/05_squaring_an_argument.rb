# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(num1, num2)
  num1 * num2
end

def square(number)
  multiply(number, number)
end

p square(5) == 25
p square(-8) == 64

# Further Exploration
# What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

def power_of_n(number, power)
  arr = []
  arr << multiply(number, number)
  (power-2).times { arr << number }
  arr.reduce(:*)
end

p power_of_n(2, 3) == 8
p power_of_n(-8, 3) == -512