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
VALID_HIT = "hit"
VALID_STAY = "stay"
RETURN = "\r"
GAME_LIMIT = 21
DEALER_LIMIT = 17

def initialize_deck
  CARDS.product(SUITS)
end

def initialize_hands
  { dealer: [], player: [] }
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
  puts format(MESSAGES['welcome'], "21": "#{GAME_LIMIT}")
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
  puts format(MESSAGES['rules'], "21": "#{GAME_LIMIT}", "17": "#{DEALER_LIMIT}")
  return_to_continue
end

def welcome_sequence
  welcome_message
  show_rules if show_rules?
end

def deal_cards(deck, hands)
  deck.shuffle!

  hands.keys.each do |player|
    var = hands[player].empty? ? 2 : 1
    var.times { hands[player] << [deck.shift].to_h }
  end
end

def deal_2_cards(deck, hands)
  clear_screen
  prompt('Dealing first two cards...')
  deal_cards(deck, hands)
end

def show_table(player, dealer)
  sleep 1
  show_players_cards(player)
  sleep 0.5
  show_dealers_cards(dealer)
  sleep 1
end

def show_cards(suit, value)
  if value.to_i == 0
    prompt("#{FACE_CARDS[value]} of #{suit}")
  else
    prompt("#{value} of #{suit}")
  end
end

def parse(card)
  suit = card[0].capitalize
  value = card[1]
  [suit, value]
end

def show_players_cards(player)
  new_line
  prompt('You have in your hand:')

  player.each do |card|
    sleep 0.5
    suit, value = parse(card)
    show_cards(suit, value)
  end
end

def show_dealers_cards(dealer)
  new_line
  prompt('Dealer has:')

  dealer.each_with_index do |card, idx|
    sleep 0.5
    suit, value = parse(card)

    if idx == 0
      prompt('[Hidden Card]')
      next
    end

    show_cards(suit, value)
  end
end

def turns(deck, player, dealer)
  winner = player_turn(deck, player)
  sleep 1
  winner ||= dealer_turn(deck, dealer)
  winner
end

def hit(deck, player)
  clear_screen
  prompt('Dealing new card...')
  sleep 0.5
  deal_cards(deck, player)
  sleep 1
end

def end_of_turn_sequence(current_player, player)
  winner = nil
  if busted?(player)
    if current_player
      prompt("You busted with #{total(player)}!")
      prompt("Dealer wins!")
      winner = 'Dealer'
    else
      prompt("Dealer busted with #{total(player)}")
      prompt("You win!")
      winner = 'Player'
    end
  else
    prompt current_player ? 'You chose to stay!' : 'Dealer chose to stay.'
  end

  winner
end

def player_turn(deck, player)
  answer = nil
  loop do
    new_line
    prompt("You have a total of #{total(player)}.")
    yml_prompt('hit_or_stay?')
    answer = gets.chomp.strip.downcase
    if answer == VALID_HIT
      hit(deck, player) if answer == VALID_HIT
      show_players_cards(player)
    end
    break if answer == VALID_STAY || busted?(player)
  end

  new_line
  current_player = true
  end_of_turn_sequence(current_player, player)
end

def dealer_turn(deck, dealer)
  clear_screen
  prompt("Dealer's turn...")
  sleep 0.5
  loop do
    show_dealers_cards(dealer)
    break if total(dealer) >= DEALER_LIMIT || busted?(dealer)
    new_line
    prompt("Dealer chose to hit.")
    return_to_continue
    sleep 1
    hit(deck, dealer)
  end

  new_line
  current_player = nil
  end_of_turn_sequence(current_player, dealer)
end

def compare_cards(player, dealer)
  if total(player) > total(dealer)
    ["Player", player]
  elsif total(dealer) > total(player)
    ["Dealer", dealer]
  end
end

def display_totals(player, dealer)
  prompt("Player has #{total(player)}")
  prompt("Dealer has #{total(dealer)}")
  new_line
end

def declare_winner(player, dealer)
  winner, winning_hand = compare_cards(player, dealer)
  sleep 1
  new_line
  if winner
    display_totals(player, dealer)
    prompt("#{winner} won with #{total(winning_hand)}!")
  else
    display_totals(player, dealer)
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
    sum -= 10 if sum > GAME_LIMIT
  end

  sum
end

def busted?(cards)
  total(cards) > GAME_LIMIT
end

def play_again?
  new_line
  yml_prompt('play_again?')
  answer = STDIN.getch.downcase
  VALID_YES.include?(answer) || answer == RETURN
end

def goodbye_sequence
  new_line
  yml_prompt('goodbye')
end

# welcome_sequence

loop do
  deck = initialize_deck
  hands = initialize_hands

  deal_2_cards(deck, hands)
  p hands
  show_table(hands)

  # winner = turns(deck, player, dealer)
  # declare_winner(player, dealer) unless winner

  break #unless play_again?
end

goodbye_sequence
