require 'yaml'
require 'io/console'
require 'pry'
require 'pry-byebug'

MESSAGES = YAML.load_file('twenty_one_messages.yml')
SUITS = %w(spades hearts diamonds clubs)
CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
FACE_CARDS = { 
  "J" => "Jack", "Q" => "Queen",
  "K" => "King", "A" => "Ace"
}
VALID_YES = %w(y yes)
# players_hand = []
# dealers_hand = []
current_player = "Player"

def initialize_deck
  SUITS.product(CARDS)
end

def initialize_hands
  [[],[]]
end

def clear_screen
  system 'clear'
end

def new_line
  puts ""
end

def return_to_continue
  puts ""
  puts "Press 'enter' to continue"
  gets
  clear_screen
end

def prompt(message)
  puts "#{message}"
end

def yml_prompt(yml_key)
  message = MESSAGES[yml_key]
  prompt(message)
end

def welcome_message
  clear_screen
  yml_prompt('welcome')
  sleep 1
  return_to_continue
end

def show_rules?
  yml_prompt('rules?')
  answer = gets.chomp.strip.downcase
  VALID_YES.include?(answer)
end

def show_rules
  clear_screen
  yml_prompt('rules')
  return_to_continue
end

def welcome_sequence
  welcome_message
  show_rules if show_rules? 
end

def deal_cards(deck, hand)
  deck.shuffle!
  if hand.empty?
    2.times { |_| hand << deck.shift }
  else
    hand << deck.shift
  end
end

def deal_initial_cards(deck, players_hand, dealers_hand)
  deal_cards(deck, players_hand)
  deal_cards(deck, dealers_hand)
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def hit(deck, hand)
  deal_cards(deck, hand)
end

def busted?(hand)
  total(hand) > 21
end

def display_hand(hand)
  new_line
  puts "Hand:"

  hand.each do |card|
    sleep 0.5
    if FACE_CARDS.include?(card[1])
      puts "#{FACE_CARDS[card[1]]} of #{card[0].capitalize}"
    else
      puts "#{card[1]} of #{card[0].capitalize}"
    end
  end

  sleep 1
  new_line
  puts "Total value of hand is #{total(hand)}"
  new_line
end

def player_turn(deck, players_hand)
  answer = nil
  loop do
    display_hand(players_hand)
    yml_prompt('hit_or_stay?')
    # binding.pry
    answer = gets.chomp.strip.downcase
    break if answer == 's'
    hit(deck, players_hand)
    break if busted?(players_hand)
  end

  if busted?(players_hand)
    new_line
    puts "Oh no, you're over 21 with #{total(players_hand)}!"
    puts "Dealer wins!"
  else
    puts "You chose to stay at #{total(players_hand)}!"
  end
end

def dealer_turn(deck, dealers_hand)
  loop do
    display_hand(dealers_hand)
    if total(dealers_hand) <= 16
      new_line
      puts "Dealer will hit..."
      sleep 1
      hit(deck, dealers_hand)
    end
    break if busted?(dealers_hand) || (total(dealers_hand) >=17)
  end

  if busted?(dealers_hand)
    new_line
    puts "Dealer is over 21 with #{total(dealers_hand)}!"
    puts "Player wins!"
  else
    puts "Dealer chose to stay at #{total(dealers_hand)}!"
  end
end

def play_again?
  new_line
  yml_prompt('play_again?')
  answer = STDIN.getch.downcase
  VALID_YES.include?(answer) || answer == "\r"
end

def reset(hand)
  hand = []
end

def reset_hands(players_hand, dealers_hand)
  reset(players_hand)
  reset(dealers_hand)
end

# welcome_sequence

loop do
  deck = initialize_deck
  players_hand, dealers_hand = initialize_hands
  deal_initial_cards(deck, players_hand, dealers_hand)
  # display_table(players_hand, dealers_hand)
  
  player_turn(deck, players_hand)
  dealer_turn(deck, dealers_hand)
  puts "time to compare cards!"
  break unless play_again?
end

new_line
yml_prompt('goodbye')
