# How does count treat the block's return value? How can we find out? by reading the documentation
# here count will rely on the blocks return value and count for how many elements it returns true, which is 2

puts (['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 5
end)

