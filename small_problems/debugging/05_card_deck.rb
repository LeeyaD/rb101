# We started working on a card game but got stuck. Check out why the code below raises a TypeError.
# Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?

# cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

# deck = { :hearts   => cards,
#          :diamonds => cards,
#          :clubs    => cards,
#          :spades   => cards }
# ISSUE #2: Local variable scoping rules! We had every value in our 'deck' hash pointing to the SAME object, when we used 'cards.pop' we mutated all of the cards in the deck. 
# LS's solution: 'cards.clone' and rather thn use #map! destructively, saved the return value to a local variable

deck = { :hearts   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :diamonds => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :clubs    => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :spades   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace] }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit
player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  p remaining_cards
  remaining_cards.map! do |card| # ISSUE #1: We weren't using the destructive #map!
    score(card)                 # so the array 'remaining_cards' was never transformed
  end
  p sum
  sum += remaining_cards.sum
end

puts sum