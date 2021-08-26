require 'yaml'

MESSAGES = YAML.load_file('ttt_messages.yml')
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
VALID_YES = %w(y yes)
VALID_OPTION = %w(1 2)
WINS = 2
scoreboard = { "Player" => 0, "Computer" => 0 }

def messages(message)
  MESSAGES[message]
end

def clear_screen
  system 'clear'
end

def return_to_continue
  puts ""
  puts "Press 'enter' to continue"
  gets
  clear_screen
end

def yml_prompt(yml_key)
  message = messages(yml_key)
  prompt(message)
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  clear_screen
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]}"
  puts "---+---+---"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]}"
  puts "---+---+---"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]}"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |sq| brd[sq] == INITIAL_MARKER }
end

def join_string(arr, delimit)
  string = arr.each_with_object("") do |num, str|
    str << "#{num}#{delimit}"
  end

  string.delete_suffix!(delimit)
end

def joinor(array, delimiter= ', ', joining_word= 'or')
  joined_string = join_string(array, delimiter)

  case array.size
  when 1 then joined_string
  when 2 then joined_string.gsub(',', " #{joining_word}")
  else joined_string.insert(-3, " #{joining_word}")
  end
end

def who_goes_first_sequence
  chooser = who_chooses_first_player?
  first_player = choose_first_player(chooser)
  prompt "#{first_player} gets to go first!"
  sleep 2
  first_player
end

def choose_first_player(chooser)
  if chooser == 'Player'
    player_chooses_first_player
  else
    computer_chooses_first_player
  end
end

def who_chooses_first_player?
  clear_screen
  answer = nil
  loop do
    yml_prompt 'who_chooses'
    answer = gets.chomp.strip.downcase
    break if VALID_OPTION.include?(answer)
    yml_prompt 'invalid_1_2_choice'
  end

  answer == '1' ? 'Player' : 'Computer'
end

def player_chooses_first_player
  clear_screen
  answer = nil

  loop do
    yml_prompt 'who_goes_first'
    answer = gets.chomp.strip
    break if VALID_OPTION.include?(answer)
    yml_prompt 'invalid_1_2_choice'
  end

  answer == '1' ? 'Player' : 'Computer'
end

def computer_chooses_first_player
  yml_prompt 'computer_choosing'
  sleep 2
  %w(Player Computer).sample
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square, your options are #{joinor(empty_squares(brd))}:"
    square = gets.chomp.strip.to_i
    break if empty_squares(brd).include?(square)
    yml_prompt 'invalid_square'
  end

  brd[square] = PLAYER_MARKER
end

def detect_strategic_move(brd, marker)
  move = WINNING_LINES.select do |line|
    brd.values_at(*line).count(marker) == 2 &&
      brd.values_at(*line).count(INITIAL_MARKER) == 1
  end

  move.empty? ? nil : move.sample
end

def move(brd, square)
  square.each do |sq|
    return sq if brd[sq] == INITIAL_MARKER
  end
end

def square_5_free?(brd)
  brd[5] == INITIAL_MARKER
end

def computer_places_piece!(brd)
  attack = detect_strategic_move(brd, COMPUTER_MARKER)
  threat = detect_strategic_move(brd, PLAYER_MARKER)

  square = if attack
             move(brd, attack)
           elsif threat
             move(brd, threat)
           elsif square_5_free?(brd)
             5
           else
             empty_squares(brd).sample
           end

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  case player
  when 'Player'
    player_places_piece!(brd)
  when 'Computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  player == 'Player' ? 'Computer' : 'Player'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if line.all? { |n| brd[n] == PLAYER_MARKER }
      return "Player"
    elsif line.all? { |n| brd[n] == COMPUTER_MARKER }
      return "Computer"
    end
  end
  nil
end

def update_score(winner, score)
  score[winner] += 1
end

def display_score(score)
  sleep 1
  puts ""
  prompt "The score is..."
  prompt "Player: #{score['Player']} | Computer: #{score['Computer']}"
end

def update_and_display_score(winner, score)
  update_score(winner, score) if winner
  display_score(score)
end

def detect_grand_winner(score)
  score.values.include?(WINS)
end

def display_grand_winner(score)
  puts ""
  prompt "#{score.key(WINS)} has won the game with a total of #{WINS} wins!"
  puts ""
end

def grand_winner_sequence(score)
  grand_winner = detect_grand_winner(score)
  display_grand_winner(score) if grand_winner
  reset_score(score) if grand_winner
end

def reset_score(score)
  score.each_key { |k| score[k] = 0 }
end

def play_again?
  sleep 1
  puts ""
  yml_prompt 'play_again?'
  answer = gets.chomp.strip.downcase
  VALID_YES.include?(answer)
end

def show_rules?
  yml_prompt 'show_rules?'
  answer = gets.chomp.strip
  VALID_YES.include?(answer)
end

def show_rules
  clear_screen
  yml_prompt 'rules'
  return_to_continue
end

def welcome_sequence
  clear_screen
  yml_prompt 'welcome'
  sleep 1
  return_to_continue
  show_rules if show_rules?
end

def display_gameplay_outcome(brd)
  if someone_won?(brd)
    winner = detect_winner(brd)
    prompt "#{winner} won!"
  else
    prompt "It's a tie!"
  end
  winner
end

def game_play(brd, current_player)
  loop do
    display_board(brd)
    place_piece!(brd, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(brd) || board_full?(brd)
  end
  display_board(brd)
end

welcome_sequence

loop do
  board = initialize_board
  current_player = who_goes_first_sequence

  game_play(board, current_player)
  winner = display_gameplay_outcome(board)

  update_and_display_score(winner, scoreboard)
  grand_winner_sequence(scoreboard)

  break unless play_again?
end

yml_prompt 'goodbye'