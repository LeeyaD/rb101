# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.


def buy_fruit(grocery_list)
    final_list = []

    grocery_list.each do |item|
      fruit = item[0]
      quantity = item[1]
      final_list << Array.new(quantity, fruit)
    end

    final_list.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
p buy_fruit([["apples", 1], ["orange", 0], ["bananas", 2]]) == ["apples", "bananas","bananas"]
p buy_fruit([["apples", 1], ["orange", 0], ["bananas", 0]]) == ["apples"]
