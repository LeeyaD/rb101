flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.
# counter = 0
# answer = (flintstones.each_with_object({}) do |name, hash|
#   hash[name] = counter
#   counter += 1
# end)

hash = {}
counter = 0

for name in flintstones
  hash[name] = counter
  counter += 1
end
p hash