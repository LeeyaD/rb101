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
  puts "=> #{message}"
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

def deal_2_cards(deck, players_hand, dealers_hand)
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
  deal_2_cards(deck, players_hand, dealers_hand)

end

new_line
yml_prompt('goodbye')
