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

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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

def detect_grand_winner(scoreboard, wins)
  scoreboard.values.include?(wins)
end

def display_grand_winner(score, wins)
  puts ""
  prompt "#{score.key(wins)} has won the game with a total of #{wins} wins!"
  puts ""
end

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
  else
    prompt "It's a tie!"
  end

  update_score(winner, scoreboard) if winner
  display_score(scoreboard)

  grand_winner = detect_grand_winner(scoreboard, wins)
  display_grand_winner(scoreboard, wins) if grand_winner

  prompt "Play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic-Tac-Toe! Goodbye!"
