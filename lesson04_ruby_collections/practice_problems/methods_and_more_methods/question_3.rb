# What is the return value of reject in the following code? Why? Returns an array of elements for which the block returned false. Puts returns nil which means for each iteration the block returned false and the current element was return
# [1, 2, 3]

[1, 2, 3].reject do |num|
  puts num
end