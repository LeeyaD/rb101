# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

p ages.reject { |k, v| v > 100 }

ages_below_100 = {}
for person in ages 
  ages_below_100[person[0]] = person[1] if person[1] < 100 
end

p ages_below_100