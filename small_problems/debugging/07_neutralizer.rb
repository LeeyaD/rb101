# We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?
# ISSUE: We're mutating the array as we're iterating over it. We end up skipping 'boring' because the words have shifted forward an index after removing 'dull'

def neutralize(sentence)
  words = sentence.split(' ')
  words_clone = words.clone
  words.each do |word|
    words_clone.delete(word) if negative?(word)
  end

  words_clone.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.