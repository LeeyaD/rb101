# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

p (statement.chars.each_with_object({}) do |char, hash|
  next if char == " "
  hash[char] = statement.count(char)
end)

str_array = statement.chars
hash = {}

def letter?(letter)
  ('A'..'z').include?(letter)
end

for char in str_array
  if letter?(char)
    hash[char] = statement.count(char)
  end
end
p hash