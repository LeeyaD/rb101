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

def deal_cards(deck, cards)
  deck.shuffle!
  if cards.empty?
    2.times { |_| cards << deck.shift }
  else
    cards << deck.shift
  end
end

def deal_first_2_cards(deck, player, dealer)
  prompt('Dealing first two cards...')
  deal_cards(deck, player)
  deal_cards(deck, dealer)
end

def show_players_cards(player)
  new_line
  prompt('You have in your hand:')
  player.each do |card|
    suit = card[0].capitalize
    value = card[1]

    if value.to_i == 0
      prompt("#{FACE_CARDS[value]} of #{suit}")
    else
      prompt("#{value} of #{suit}")
    end
  end
end

def show_dealers_cards(dealer)
  new_line
  prompt('Dealer has:')
  dealer.each_with_index do |card, idx|
    suit = card[0].capitalize
    value = card[1]

    if idx == 0
      prompt('Hidden Card')
      next
    end

    if value.to_i == 0
      prompt("#{FACE_CARDS[value]} of #{suit}")
    else
      prompt("#{value} of #{suit}")
    end
  end
end

def player_turn(player)
  answer = nil
  loop do
    new_line
    yml_prompt('hit_or_stay?')
    answer = gets.chomp.strip.downcase
    break if answer == 's' || busted?
  end

  if busted?
    prompt("You busted with #{total(player)}!")
    # end the game? ask the user to play again?
  else
    prompt('You chose to stay!')
  end
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

def busted?(cards)
  total(cards) > 21
end

def play_again?
  new_line
  yml_prompt('play_again?')
  answer = STDIN.getch.downcase
  VALID_YES.include?(answer) || answer == "\r"
end

def reset(cards)
  cards = []
end

def reset_hands(player, dealer)
  reset(player)
  reset(dealer)
end

# welcome_sequence

loop do
  deck = initialize_deck
  player, dealer = initialize_hands
  deal_first_2_cards(deck, player, dealer)
  sleep 1
  show_players_cards(player)
  show_dealers_cards(dealer)
  sleep 1
  player_turn(player)
  # dealer_turn(dealer)

  break unless play_again?
end

new_line
yml_prompt('goodbye')


