# Write a method that will take a short line of text, and print it within a box.

def print_in_box(string)
  banner_length = string.length + 4
  excess = banner_length - 83
  if excess > 0
    string = string.slice(0, 79)
    banner_length -= excess
  end

  top_bottom =  "+" + ("-" * (banner_length - 2)) + "+"
  above_below = "|" + (" " * (banner_length - 2)) + "|"
  center = "| " + string + " |"

  puts top_bottom
  puts above_below
  puts center
  puts above_below
  puts top_bottom
end
print_in_box('To boldly go where no one has gone before.')
print_in_box('To boldly go where no one has gone before. Saying whatever to make this line incredibly long.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

