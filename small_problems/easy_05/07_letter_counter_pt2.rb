# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

# def word_sizes(string)
#   array = string.split
#   lengths = array.map { |word| word.delete("^A-z").length }

#   lengths.each_with_object({}) do |length, hash|
#     hash[length] = lengths.count(length)
#   end
# end

def word_sizes(string)
  array = string.split
  alpha_array = array.map do |word|
    alpha_word = word.chars.select do |char|
      ("A".."z").include?(char)
    end.join
  end

  lengths = alpha_array.map { |word| word.length }
  lengths.each_with_object({}) do |length, hash|
    hash[length] = lengths.count(length)
  end
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}