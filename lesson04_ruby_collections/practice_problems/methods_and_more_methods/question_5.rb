# What does shift do in the following code? How can we find out? From the docs. When called on a Hash, it removes the first key-value pair and returns it in a nested array
# => [:a, 'ant']
# hash => { b: 'bear'}

  hash = { a: 'ant', b: 'bear' }
  p hash.shift
  p hash