#Assume you have the following code:
require 'date'

puts Date.civil #=> (X) #<Date: 2021-01-01 | (O) #<Date: -4712-01-01
puts Date.civil(2016) #=> #<Date: 2016-01-01
puts Date.civil(2016, 5) #=> #<Date: 2016-05-01
puts Date.civil(2016, 5, 13) #=> #<Date: 2016-05-13
# What will each of the 4 puts statements print?