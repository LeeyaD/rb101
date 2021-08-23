require 'pry'
require 'pry-byebug'

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
wins = 2
scoreboard = { "Player" => 0, "Computer" => 0 }

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
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

def who_goes_first_prompt
  system 'clear'
  answer = nil

  loop do
    prompt "Who should go first? ('1' for you or '2' for the Computer)"
    answer = gets.chomp
    break if %w(1 2).include?(answer)
    prompt "That's not a valid choice. '1' or '2' please."
  end

  answer
end

def who_goes_first?
  answer = who_goes_first_prompt
  answer == '1' ? 'Player' : 'Computer'
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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a free square," \
    " your options are #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice. Enter a value 1-9."
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

  if attack
    square = move(brd, attack)
  elsif threat
    square = move(brd, threat)
  elsif square_5_free?(brd)
    square = 5
  else
    square = empty_squares(brd).sample
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
  if player == 'Player'
    return 'Computer'
  else
    'Player'
  end
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
  puts ""
  prompt "The score is..."
  prompt "Player: #{score['Player']} | Computer: #{score['Computer']}"
end

def score_sequence(winner, score)
  update_score(winner, score) if winner
  display_score(score)
end

def detect_grand_winner(score, wins)
  score.values.include?(wins)
end

def display_grand_winner(score, wins)
  puts ""
  prompt "#{score.key(wins)} has won the game with a total of #{wins} wins!"
  puts ""
end

def grand_winner_sequence(score, wins)
  grand_winner = detect_grand_winner(score, wins)
  display_grand_winner(score, wins) if grand_winner
  reset_score(score) if grand_winner
end

def reset_score(score)
  score.each_key { |k| score[k] = 0 }
end

def play_again?
  prompt "Play again? (y/n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end


loop do
  board = initialize_board
  current_player = who_goes_first?
  loop do
    display_board(board)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
  else
    prompt "It's a tie!"
  end

  score_sequence(winner, scoreboard)
  grand_winner_sequence(scoreboard, wins)

  break unless play_again?
end

prompt "Thanks for playing Tic-Tac-Toe! Goodbye!"
