# How does take work? Is it destructive? How can we find out?
# From docs, can't tell if it's destructive will test in irb
# not destructive
arr = [1, 2, 3, 4, 5]
p arr.take(2)
p arr