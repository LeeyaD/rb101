# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |k, v|
  v.each do |word|
    word.chars.each do |letter|
      puts letter if (/[aeiou]/).match?(letter)
    end
  end
end