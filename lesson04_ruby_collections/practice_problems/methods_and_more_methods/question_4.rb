# What is the return value of each_with_object in the following code? Why?
#{a: 'ant', b: 'bear', c: 'cat'}
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end