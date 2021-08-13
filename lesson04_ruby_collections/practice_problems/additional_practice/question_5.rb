flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

name = (flintstones.select do |name|
  name.slice(0,2) == "Be"
end.first)

p flintstones.index(name)


index = 0
loop do
  p index if flintstones[index].slice(0,2) == "Be"
  index += 1
  break index if index == flintstones.size
end

