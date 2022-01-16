# Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

# ["demo", "dome", "mode"]
# ["none", "neon"]
#(etc)

def anagrams(array)
  dup_arr = array.clone
  counter = 0

  while !dup_arr.empty?
    curr_anagram = dup_arr.shift.chars
    group = []
    array.each do |word|
      if curr_anagram.all? { |l| word.include?(l) }
        group << word 
        dup_arr.delete(word)
      end
    end
    p group
    counter += 1
  end
end

anagrams(words)