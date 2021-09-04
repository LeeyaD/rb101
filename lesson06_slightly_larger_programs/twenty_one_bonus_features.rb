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
  (CARDS.product(SUITS)).shuffle!
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

def deal_card(deck, hands, player)
    hands[player] << [deck.shift].to_h
end

def deal_2_cards(deck, hands)
  clear_screen
  prompt('Dealing first two cards...')
  hands.keys.each do |player|
    2.times { deal_card(deck, hands, player) }
  end
end

def state_player(player)
  new_line
  player == :dealer ? prompt('Dealer has:') : prompt('You have in your hand:')
end

def show_hand(card)
  card.each do |value, suit|
    if value.to_i == 0
      prompt("#{FACE_CARDS[value]} of #{suit}")
    else
      prompt("#{value} of #{suit}")
    end
  end
end

def dealers_first_card?(player, index)
  (player == :dealer) && (index == 0)
end

def display_table(hands)
  sleep 1
  hands.keys.each do |player|
    state_player(player)
    hands[player].each_with_index do |card, idx|
      sleep 0.75
      if dealers_first_card?(player, idx)
        prompt('[Hidden Card]')
        next
      end
      show_hand(card)
    end
    sleep 0.5
  end
  sleep 1
end

def turns(deck, hands)
  winner = player_turn(deck, hands, :player)
  sleep 1
  winner ||= dealer_turn(deck, hands, :dealer)
  winner
end

def hit(deck, hands, player)
  clear_screen
  prompt('Dealing new card...')
  sleep 0.5
  deal_card(deck, hands, player)
  sleep 1
end

def end_of_turn_sequence(current_player, hands, player)
  winner = nil
  if busted?(hands[player])
    if current_player
      prompt("You busted with #{total(hands[player])}!")
      prompt("Dealer wins!")
      winner = 'Dealer'
    else
      prompt("Dealer busted with #{total(hands[player])}")
      prompt("You win!")
      winner = 'Player'
    end
  else
    prompt current_player ? 'You chose to stay!' : 'Dealer chose to stay.'
  end

  winner
end

def player_turn(deck, hands, player)
  answer = nil
  loop do
    new_line
    prompt("You have a total of #{total(hands[player])}.")
    yml_prompt('hit_or_stay?')
    answer = gets.chomp.strip.downcase
    if answer == VALID_HIT
      hit(deck, hands, player) if answer == VALID_HIT
      hands[player].each { |card| show_hand(card)}
    end
    break if answer == VALID_STAY || busted?(hands[player])
  end

  new_line
  current_player = true
  end_of_turn_sequence(current_player, hands, player)
end

def dealer_turn(deck, hands, dealer)
  clear_screen
  prompt("Dealer's turn...")
  sleep 0.5
  loop do
    hands[dealer].each { |card| show_hand(card)}
    break if total(hands[dealer]) >= DEALER_LIMIT || busted?(hands[dealer])
    new_line
    prompt("Dealer chose to hit.")
    return_to_continue
    sleep 1
    hit(deck, hands, dealer)
  end

  new_line
  current_player = nil
  end_of_turn_sequence(current_player, hands, dealer)
end

def compare_cards(hands, player, dealer)
  if total(hands[player]) > total(hands[dealer])
    ["Player", hands[player]]
  elsif total(hands[dealer]) > total(hands[player])
    ["Dealer", hands[dealer]]
  end
end

def display_totals(hands, player, dealer)
  prompt("Player has #{total(hands[player])}")
  prompt("Dealer has #{total(hands[dealer])}")
  new_line
end

def declare_winner(hands, player, dealer)
  winner, winning_hand = compare_cards(hands, player, dealer)
  sleep 1
  new_line
  if winner
    display_totals(hands, player, dealer)
    prompt("#{winner} won with #{total(winning_hand)}!")
  else
    display_totals(hands, player, dealer)
    prompt("It's a draw!")
  end
end

def total(cards)
  values = cards.map do |card| 
    card.keys[0]
  end

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
  display_table(hands)

  winner = turns(deck, hands)
  declare_winner(hands, :player, :dealer) unless winner

  break #unless play_again?
end

goodbye_sequence
