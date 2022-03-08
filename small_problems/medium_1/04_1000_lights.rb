# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# INPUT: an integer
# - the total number of lights
# - the number of passes made
# OUTPUT: an array of integers
# - the lights left on

# DS: array
# ALGO
# Create a method that takes 1 argument, number
# Create an array of false values, the number of elements matching the given number
# Iterate thru array the given number of times, starting from 1
# - first pass, toggle every element
# - second pass, toggle every 2 elements
# - third pass, toggle every 3 elements
# - so on until the end
# Iterate thru array, selecting the indexes of the true elements

def on_lights(array)
  switched_on = []
  array.each_with_index do |light, idx|
    switched_on << (idx + 1) if light
  end
  
  switched_on
end

def toggle_switches(lights, n)
  lights.map!.with_index do |light, idx|
    if (idx + 1) % n == 0
      light = light ? false : true
    end
    
    light
  end
end

def light_switching(n)
  lights = Array.new(n, false)

  1.upto(n) do |n|
    toggle_switches(lights, n)
  end

  on_lights(lights)
end

p light_switching(5) == [1, 4]
p light_switching(10) == [1, 4, 9]
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].