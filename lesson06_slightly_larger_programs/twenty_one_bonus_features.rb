require 'yaml'
require 'io/console'

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
wins = 0

def valid?(input)
  (input.to_i.to_s == input) && (input.to_i > 0)
end

def set_wins
  answer = nil
  loop do
    yml_prompt('how_many_wins?')
    answer = gets.chomp.strip
    break if valid?(answer)
    yml_prompt('invalid_answer')
  end
  answer.to_i
end

def initialize_deck
  (CARDS.product(SUITS)).shuffle!
end

def initialize_hands
  { dealer: [], player: [] }
end

def initialize_scoreboard
  { Dealer: 0, Player: 0 }
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
  puts format(MESSAGES['welcome'], "21": GAME_LIMIT.to_s)
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
  puts format(MESSAGES['rules'], "21": GAME_LIMIT.to_s, "17": DEALER_LIMIT.to_s)
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
  hand_totals = []
  hands.keys.each do |player|
    2.times { deal_card(deck, hands, player) }
    hand_totals << total(hands[player])
  end
  hand_totals
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

def show_cards(hands, player)
  hands[player].each_with_index do |card, idx|
    sleep 0.75
    if dealers_first_card?(player, idx)
      prompt('[Hidden Card]')
      next
    end
    show_hand(card)
  end
end

def display_table(hands)
  sleep 1
  hands.keys.each do |player|
    state_player(player)
    show_cards(hands, player)
    sleep 0.5
  end
  sleep 1
end

def turns(deck, hands, p_total, d_total)
  winner, p_total = player_turn(deck, hands, :player, p_total)
  sleep 1
  unless winner
    winner, d_total = dealer_turn(deck, hands, :dealer, d_total)
  end
  [winner, p_total, d_total]
end

def hit(deck, hands, player)
  clear_screen
  prompt('Dealing new card...')
  deal_card(deck, hands, player)
  sleep 0.5
end

def busted_prompt(player, card_total, winner)
  if player
    prompt("You busted with #{card_total}!")
    prompt("Dealer wins!")
    winner = 'Dealer'
  else
    prompt("Dealer busted with #{card_total}")
    prompt("You win!")
    winner = 'Player'
  end
  winner
end

def end_of_turn_sequence(current_player, card_total)
  winner = nil
  sleep 0.75
  if busted?(card_total)
    winner = busted_prompt(current_player, card_total, winner)
  else
    prompt current_player ? 'You chose to stay!' : 'Dealer chose to stay.'
  end
  [winner, card_total]
end

def player_turn(deck, hands, player_sym, p_total)
  loop do
    new_line
    prompt("You have a total of #{p_total}.")
    yml_prompt('hit_or_stay?')
    answer = gets.chomp.strip.downcase
    if answer == VALID_HIT
      hit(deck, hands, player_sym) if answer == VALID_HIT
      p_total = total(hands[player_sym])
      show_cards(hands, player_sym)
    end
    break if answer == VALID_STAY || busted?(p_total)
  end

  new_line
  current_player = true
  end_of_turn_sequence(current_player, p_total)
end

def dealer_turn(deck, hands, dealer_sym, d_total)
  clear_screen
  prompt("Dealer's turn...")
  loop do
    show_cards(hands, dealer_sym)
    sleep 0.5
    break if d_total >= DEALER_LIMIT || busted?(d_total)
    new_line
    prompt("Dealer chose to hit.")
    return_to_continue
    hit(deck, hands, dealer_sym)
    d_total = total(hands[dealer_sym])
  end

  new_line
  current_player = nil
  end_of_turn_sequence(current_player, d_total)
end

def compare_cards(hands, p_total, d_total)
  if p_total > d_total
    ["Player", hands[:player]]
  elsif d_total > p_total
    ["Dealer", hands[:dealer]]
  end
end

def display_totals(p_total, d_total)
  prompt("Player has #{p_total}")
  sleep 0.5
  prompt("Dealer has #{d_total}")
  new_line
end

def declare_winner(hands, p_total, d_total)
  winner, winning_hand = compare_cards(hands, p_total, d_total)
  sleep 1
  new_line
  display_totals(p_total, d_total)
  sleep 0.5
  if winner
    prompt("#{winner} won with #{total(winning_hand)}!")
  else
    prompt("It's a draw!")
  end
  winner
end

def get_values(cards)
  cards.map do |card|
    card.keys[0]
  end
end

def total(cards)
  values = get_values(cards)

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

def busted?(card_total)
  card_total > GAME_LIMIT
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

def update_score(scoreboard, winner)
  (scoreboard[winner.to_sym] += 1) if winner
end

def display_score(scoreboard)
  return_to_continue
  prompt('The score is...')
  scoreboard.keys.each do |player|
    prompt("#{player.to_sym}: #{scoreboard[player]}")
  end
  sleep 1
end

def update_and_display_score(scoreboard, winner)
  update_score(scoreboard, winner)
  display_score(scoreboard)
end

def find_grand_winner(scoreboard, wins)
  scoreboard.key(wins)
end

def declare_grand_winner(grand_winner, wins)
  sleep 1
  new_line
  prompt("#{grand_winner} is the Grand Winner with #{wins} win(s)!")
  sleep 1
end

def reset_score(scoreboard)
  scoreboard.keys.each do |player|
    scoreboard[player] = 0
  end
end

def grand_winner_sequence(grand_winner, scoreboard, wins)
  if grand_winner
    declare_grand_winner(grand_winner, wins)
    reset_score(scoreboard)
  end
end

welcome_sequence
scoreboard = initialize_scoreboard
wins = set_wins

loop do
  deck = initialize_deck
  hands = initialize_hands

  d_total, p_total = deal_2_cards(deck, hands)
  display_table(hands)

  winner, p_total, d_total = turns(deck, hands, p_total, d_total)
  winner ||= declare_winner(hands, p_total, d_total)

  update_and_display_score(scoreboard, winner)
  grand_winner = find_grand_winner(scoreboard, wins)
  grand_winner_sequence(grand_winner, scoreboard, wins)

  break unless play_again?
  wins = set_wins if grand_winner
end

goodbye_sequence
