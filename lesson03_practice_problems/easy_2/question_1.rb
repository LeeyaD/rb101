# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present.

p ages.has_key?('Spot')
# Bonus: What are two other hash methods that would work just as well for this solution?
p ages.key?('Spot')
p ages.keys.include?('Spot')