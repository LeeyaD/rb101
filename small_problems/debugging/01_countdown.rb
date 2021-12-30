# Our countdown to launch isn't behaving as expected. Why? 
# Because the value of 'counter' is never reassigned to the return value of #decrease

# Change the code so that our program successfully counts down from 10 to 1.

def decrease(counter)
  counter -= 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# Further Exploration
# We specify 10 two times, which looks a bit redundant. It should be possible to specify it only once. Can you refactor the code accordingly?