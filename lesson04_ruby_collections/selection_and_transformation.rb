produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# How would you implement a method like this?
def select_fruit(produce)
  fruits = {}
  fruit_name = produce.keys

  for fruit in fruit_name
    if produce[fruit] == 'Fruit'
      fruits[fruit] = produce[fruit]
    end
  end
  fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# -------------------------------------------

# Can you implement a double_numbers! method that mutates its argument?

def double_numbers!(numbers) #<-added bang
  counter = 0

  loop do
    break if counter == numbers.size
    
    numbers[counter] *= 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
my_numbers

# -------------------------------------------

# Exercise: What if we wanted to transform the numbers based on their position in the array rather than their value?
# Code a solution that doubles the numbers that have odd indices:

def double_odd_indicies(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts double_odd_indicies(my_numbers) #== [1, 8, 3, 14, 2, 12]

# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]
# -------------------------------------------

# Let's update our double_numbers method to not only be able to double the values in an array, but to multiply by any number. For example, let's create a method called multiply that can take an additional argument to determine the transformation criteria.
# Try coding a method that allows you to multiply every array item by a specified value
def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size
    
    multiplied_numbers << numbers[counter] * multiplier

    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]
