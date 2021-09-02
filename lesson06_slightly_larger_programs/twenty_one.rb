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
VALID_HIT = "h"
VALID_STAY = "s"
RETURN = "\r"

def initialize_deck
  SUITS.product(CARDS)
end

def initialize_hands
  [[], []]
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
  answer = STDIN.getch.downcase
  VALID_YES.include?(answer) || answer == RETURN
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

def deal_cards(deck, cards)
  deck.shuffle!
  if cards.empty?
    2.times { |_| cards << deck.shift }
  else
    cards << deck.shift
  end
end

def deal_first_2_cards(deck, player, dealer)
  clear_screen
  prompt('Dealing first two cards...')
  deal_cards(deck, player)
  deal_cards(deck, dealer)
end

def show_players_cards(player)
  new_line
  prompt('You have in your hand:')
  sleep 0.5
  player.each do |card|
    suit = card[0].capitalize
    value = card[1]

    if value.to_i == 0
      prompt("#{FACE_CARDS[value]} of #{suit}")
    else
      prompt("#{value} of #{suit}")
    end
    sleep 0.5
  end
end

def show_dealers_cards(dealer)
  new_line
  prompt('Dealer has:')
  sleep 0.5
  dealer.each_with_index do |card, idx|
    suit = card[0].capitalize
    value = card[1]

    if idx == 0
      prompt('[Hidden Card]')
      next
    end

    if value.to_i == 0
      prompt("#{FACE_CARDS[value]} of #{suit}")
    else
      prompt("#{value} of #{suit}")
    end
    sleep 0.5
  end
end

def hit(deck, player)
  clear_screen
  prompt('Dealing new card...')
  sleep 1
  deal_cards(deck, player)
  sleep 1
end

def player_turn(deck, player)
  answer = nil
  loop do
    new_line
    yml_prompt('hit_or_stay?')
    answer = STDIN.getch.downcase
    if answer == VALID_HIT
      hit(deck, player) if answer == VALID_HIT
      show_players_cards(player)
    end
    break if answer == VALID_STAY || busted?(player)
  end

  new_line
  if busted?(player)
    prompt("You busted with #{total(player)}!")
    prompt("Dealer wins!")
    'Dealer'
  else
    prompt('You chose to stay!')
    nil
  end
end

def dealer_turn(deck, dealer)
  clear_screen
  prompt("Dealer's turn...")
  sleep 0.5
  loop do
    show_dealers_cards(dealer)
    break if total(dealer) >= 17 || busted?(dealer)
    new_line
    prompt("Dealer chose to hit.")
    return_to_continue
    sleep 1
    hit(deck, dealer)
  end

  new_line
  if busted?(dealer)
    prompt("Dealer busted with #{total(dealer)}")
    prompt("You win!")
    'Player'
  else
    prompt("Dealer chose to stay.")
    nil
  end
end

def compare_cards(player, dealer)
  if total(player) > total(dealer)
    ["Player", player]
  elsif total(dealer) > total(player)
    ["Dealer", dealer]
  end
end

def declare_winner(player, dealer)
  winner, winning_hand = compare_cards(player, dealer)
  sleep 1
  new_line
  if winner
    prompt("#{winner} won with #{total(winning_hand)}!")
  else
    prompt("It's a draw!")
  end
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
           end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def play_again?
  new_line
  yml_prompt('play_again?')
  answer = STDIN.getch.downcase
  VALID_YES.include?(answer) || answer == RETURN
end

welcome_sequence

loop do
  deck = initialize_deck
  player, dealer = initialize_hands
  deal_first_2_cards(deck, player, dealer)
  sleep 1
  show_players_cards(player)
  show_dealers_cards(dealer)
  sleep 1
  winner = player_turn(deck, player)
  sleep 1
  winner ||= dealer_turn(deck, dealer)
  declare_winner(player, dealer) unless winner
  break unless play_again?
end

new_line
yml_prompt('goodbye')
